#!/usr/bin/env python3
"""
Script per diagnosticare perché bibtexparser fallisce su certe entries
"""
import bibtexparser
import re, unicodedata
import json
from collections import Counter, defaultdict

from sentence_transformers import SentenceTransformer
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans
from scipy.sparse import hstack
import numpy as np

BIBFILE = '_bibliography/papers.bib'
json_file = '_data/topic_keywords.json'


def vectorize_keywords(kws):

    v_char = TfidfVectorizer(lowercase=True, analyzer="char_wb", ngram_range=(3,5), min_df=1)
    v_word = TfidfVectorizer(lowercase=True, analyzer="word",    ngram_range=(1,2), min_df=1)
    Xc = v_char.fit_transform(kws)
    Xw = v_word.fit_transform(kws)
    X  = hstack([Xc, Xw]).tocsr()
    return X

def k_heuristic(n, avg_size=12, k_min=2, k_max=60):
    if n < 2:
        return 1
    k = max(k_min, min(k_max, n // max(2, avg_size)))
    # evita k >= n (requisito KMeans)
    return min(k, n-1)

def cluster_keywords_named_tfidf(keywords, n_clusters=10, seed=42, model_name="all-MiniLM-L6-v2", embed=False):
    """
    Raggruppa le keyword in n_clusters con TF-IDF + KMeans.
    Il 'topic' di ciascun cluster è la keyword medoid (più vicina al centroide).

    Parameters
    ----------
    keywords : list[str]
    n_clusters : int
    seed : int

    Returns
    -------
    dict[str, list[str]]  # {topic_keyword: [keywords_del_cluster]}
    """
    # 1) TF-IDF: word n-grams + char n-grams => robusto su stringhe brevi e varianti
    vec = TfidfVectorizer(
        lowercase=True,
        analyzer="char_wb",       # char n-grams “word-boundary aware”
        ngram_range=(3, 5),       # 3–5 char, buono per matching “fuzzy”
    )
    #X = vec.fit_transform(keywords)

    # 1. Embedding delle keyword
    if embed:
        model = SentenceTransformer(model_name)
        X = model.encode(keywords, normalize_embeddings=True)
    else:
        X = vectorize_keywords(keywords)

    # 2) KMeans
    k = min(n_clusters, len(keywords))
    kmeans = KMeans(n_clusters=k, random_state=seed, n_init="auto")
    labels = kmeans.fit_predict(X)


    # 3) Gruppi e scelta medoid (massima similarità coseno al centroide)
    by_cluster = defaultdict(list)
    for i, lab in enumerate(labels):
        by_cluster[lab].append(i)

    topic_map = {}
    for lab, idxs in by_cluster.items():
        cluster_kws = sorted([keywords[i] for i in idxs], key=str.lower)
        topic = min(cluster_kws, key=len)  # <-- keyword più corta
        topic_map[topic] = cluster_kws


    # 4) Ordina per dimensione cluster (desc), poi alfabetico
    topic_map = dict(sorted(topic_map.items(),
                            key=lambda kv: (-len(kv[1]), kv[0].lower())))
    return topic_map


def clean_key(key):
    """
    Pulisce una chiave BibTeX rimuovendo caratteri non validi
    """
    # Rimuovi spazi e caratteri non alfanumerici
    key = unicodedata.normalize("NFKC", key.strip())
    key = re.sub(r'\s+', '_', key)  # sostituisci spazi con underscore
    key = re.sub(r'[^\w\-]', '', key)  # rimuovi caratteri non validi
    return key

def clean_save_bibtex(file):
    """
    prende il bibtex originale e salva una versione in cui ha applicato clean_key a tutte le keys
    """
    output_file = "_bibliography/papers_cleaned.bib"
    with open(file, encoding="utf-8-sig") as f:
        txt = f.read()
    # Normalizza NBSP e newline
    txt = txt.replace("\u00A0", " ")
    txt = txt.replace("\r\n", "\n").replace("\r", "\n")
        # Pulisci le chiavi: @TYPE{ KEY , ... } -> @type{key,...}
    # (manteniamo il TYPE così com'è; opzionalmente puoi farlo lowercase)
    key_fixes = 0
    keys_seen = Counter()
    def repl(m):
        nonlocal key_fixes
        typ = m.group("type")
        raw = m.group("key")
        cleaned = clean_key(raw)
        if cleaned != raw.strip():
            key_fixes += 1
        # gestisci collisioni successive
        base = cleaned
        i = 1
        while keys_seen[cleaned]:
            i += 1
            cleaned = f"{base}_{i}"
        keys_seen[cleaned] += 1
        return f"@{typ}{{{cleaned},"

    txt = re.sub(r"@(?P<type>\w+)\s*\{\s*(?P<key>[^,\n\}]+)\s*,", repl, txt)



    with open(output_file, "w", encoding="utf-8") as out:
        out.write(txt)
    return output_file
    


if __name__ == "__main__":
    cleaned_file = clean_save_bibtex(BIBFILE)

    with open(cleaned_file) as bibtex_file:
        bib_database = bibtexparser.load(bibtex_file)

    print(len(bib_database.entries), "entries found.")
    print(len(bib_database.comments), "comments found.")
    print(len(bib_database.strings), "strings found.")
    print(len(bib_database.preambles), "preambles found.")

    keywords_list = []
    for entry in bib_database.entries:
        keywords_list.extend(re.split(r'[;,]', entry['keywords']) if 'keywords' in entry else [])
    keywords_list = [kw.strip() for kw in keywords_list if kw.strip()]
    unique_keywords = list(set(keywords_list))
    print(len(unique_keywords), "unique keywords found.")

    k = k_heuristic(len(unique_keywords), avg_size=10, k_min=2, k_max=100)
    print(f"Clustering in {k} clusters (heuristic).")

    clusters = cluster_keywords_named_tfidf(unique_keywords, n_clusters=k, embed=True)
    for cluster_id, kws in clusters.items():
        print(f"{cluster_id}: {kws}")


    with open(json_file, "w", encoding="utf-8") as f:
        json.dump(clusters, f, ensure_ascii=False, indent=2)

    print("Esportato in " + json_file)


