#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bibtex'
require 'json'
require 'fileutils'

# --- Config ---
BIBFILE     = ENV['BIB_PATH']   || '_bibliography/papers.bib'
OUT_DIR     = ENV['OUT_DIR']    || '_keywords'
TOPIC_JSON  = ENV['TOPIC_JSON'] || '_data/topic_keywords.json'
CLEAN_OLD   = ENV['CLEAN_OLD']  == '1' # opzionale: cancella i .md esistenti

abort "ERROR: BibTeX file not found: #{BIBFILE}" unless File.exist?(BIBFILE)

FileUtils.mkdir_p(OUT_DIR)
if CLEAN_OLD
  Dir.glob(File.join(OUT_DIR, '*.md')).each { |f| File.delete(f) }
end

def slugify(str)
  str.to_s.downcase.strip
     .gsub(/[^\p{Alnum}\s-]/u, '-') # non alfanumerici -> '-'
     .gsub(/\s+/, '-')              # spazi -> '-'
     .gsub(/-+/, '-')               # collapse '-'
     .gsub(/^-|-$/, '')             # trim '-'
end

# rimuove NBSP, apici/virgolette ai bordi, spazi extra
def normalize_kw(s)
  s.to_s
   .tr("\u00A0", ' ')                 # NBSP → spazio
   .gsub(/\A[\'\"\u2018\u2019\u201C\u201D]+/, '')  # togli apici/virgolette a sinistra
   .gsub(/[\'\"\u2018\u2019\u201C\u201D]+\z/, '')  # togli apici/virgolette a destra
   .strip
end

# --- 1) Leggi il .bib ed estrai le keyword (solo 'keywords') ---
bib = BibTeX.open(BIBFILE)

counts = Hash.new(0)
bib.each do |e|
  next unless e.respond_to?(:[]) # è una entry BibTeX::Entry
  raw = e[:keywords].to_s
  next if raw.strip.empty?

  raw.split(/[;,]/).each do |k|
    k = normalize_kw(k)
    next if k.empty?
    counts[k] += 1
  end
end

puts "Found #{counts.size} unique keywords."

# --- 2) Carica la mappa dei topic (keyword_topics.json) ---
topic_map = {}
if File.exist?(TOPIC_JSON)
  begin
    topic_map = JSON.parse(File.read(TOPIC_JSON))
  rescue => e
    warn "WARNING: cannot parse #{TOPIC_JSON}: #{e}"
  end
else
  warn "WARNING: #{TOPIC_JSON} not found. All keywords will get full pages (no redirects)."
end

# Inverti: keyword (exact match, stripped) -> topic_slug
kw_to_topic = {}
topic_map.each do |raw_topic_key, arr|
  topic_slug = slugify(raw_topic_key)            # ⇐ garantisce /topics/<slug>/
  Array(arr).each do |k|
    kw_to_topic[k.strip.downcase] = topic_slug   # match case-insensitive
  end
end

# --- 3) Genera le pagine ---
generated = 0
redirects = 0
pages     = 0

counts.keys.sort.each do |kw|
  k_clean = kw.strip
  slug    = slugify(k_clean)
  path    = File.join(OUT_DIR, "#{slug}.md")

    # cerca il topic (case-insensitive)
  topic_slug = kw_to_topic[k_clean.downcase]

  if topic_slug

    content = <<~YAML
    ---
    layout: null
    title: "#{k_clean}"
    redirect_to: "/topics/#{topic_slug}/"
    permalink: /keywords/#{slug}/
    ---
    YAML
    File.write(path, content)
    redirects += 1
  else
    # Pagina keyword “piena” (usa il layout keyword esistente)
    content = <<~YAML
    ---
    layout: keyword
    title: "Publications tagged with #{k_clean}"
    keyword: #{k_clean}
    permalink: /keywords/#{slug}/
    ---
    YAML
    File.write(path, content + "\n<!-- Generated automatically -->\n")
    pages += 1
  end

  generated += 1
end

puts "Generated #{generated} keyword pages in #{OUT_DIR}/ (#{redirects} redirects, #{pages} full pages)."