# 🧭 Website Maintenance and Research Dissemination Guide

**Author:** Lelio Campanile, PhD  
**Website:** [leliocampanile.github.io](https://leliocampanile.github.io)  
**Purpose:** Internal README for maintaining and updating the academic website, publications, and blog posts.

---

## 🗓️ Monthly Routine

Every first weekend of the month:

- [ ] Check **Scopus** for newly indexed papers.
- [ ] Update `_bibliography/papers.bib` **only** with papers indexed in Scopus.
- [ ] Run local scripts:
  - `python .github/scripts/debug_keywords.py`
  - `ruby .github/scripts/generate_keywords_redirect.rb`
- [ ] Commit and push to GitHub to trigger site rebuild.
- [ ] Review site navigation and research pages for consistency.

Optional:
- [ ] Write one **short post** (technical, methodological, or research insight).

---

## 📚 When a Paper is Accepted

📌 **Goal:** announce the acceptance (not yet update `.bib`).

1. Create a new post in `_posts/`  
   Example filename:  
   ```
   YYYY-MM-DD-paper_accepted_iccsa.md
   ```

2. Use this front matter:

   ```yaml
   ---
   title: "Paper accepted at [Conference Name]: [Short Title]"
   date: YYYY-MM-DD
   categories: [research, publications]
   tags: [AI, Simulation, ConferenceName]
   excerpt: "Our new paper has been accepted at [Conference Name], exploring [short focus]."
   ---
   ```

3. Write a short paragraph describing the research idea and significance.  
   (No BibTeX update yet.)

4. Cross-post to **LinkedIn** with a more narrative tone.  
   Optional: share on **X** with 1–2 sentences and an image.

---

## 📘 When the Paper is Published and Indexed

📌 **Goal:** update bibliography and create a short publication post.

1. Export BibTeX entry from **Scopus** → append it to `_bibliography/papers.bib`
2. Run:
   ```bash
   python .github/scripts/debug_keywords.py
   ruby .github/scripts/generate_keywords_redirect.rb
   ```
3. Commit and push the updated site.
4. Add an optional blog post:

   ```yaml
   ---
   title: "New publication in Lecture Notes in Computer Science"
   date: YYYY-MM-DD
   categories: [research, publications]
   tags: [Blockchain, Simulation, GDPR, SmartCity]
   excerpt: "Our latest paper presents a GDPR-compliant blockchain–edge simulation framework for smart city infrastructures."
   ---
   ```

   Content example:

   ```
   This study formalizes a method to analyze throughput, saturation, and privacy under variable workloads.

   📄 [Read the paper on SpringerLink](https://doi.org/10.xxxx)
   ```

---

## 🧠 Monthly Blog Post Ideas

To maintain a steady publication rhythm (≈1 post/month):

- 🧩 **Technical Notes:** Python workflows, simulation tools, or reproducible setups.  
- 🧪 **Research Insights:** Lessons learned, methodological thoughts, or paper summaries.  
- 📊 **Tools & Frameworks:** Introduce updates to your own tools (SimPy models, SHIELD, LLMTextCrafter, etc.).  
- 🔍 **Mini Guides:** short “how-to”s for frameworks (e.g., HuggingFace, VS Code, SimPy, Pandas).

Use this filename convention:
```
_posts/YYYY-MM-DD-short_descriptive_title.md
```

---

## 🔁 Cross-Posting Strategy

| Platform     | When to Use | What to Post | Notes |
|---------------|-------------|---------------|--------|
| **LinkedIn**  | Every paper accepted/published | Short narrative, 3–4 lines + image | Most relevant for visibility |
| **X (Twitter)** | Optional | One-sentence highlight + link | Good for conference exposure |
| **Medium**    | For technical articles | Repost your how-to posts | Add canonical link to your main site |

---

## ⚙️ Maintenance and Sync

### 🔹 Before site updates
- [ ] Run `bundle exec jekyll clean`
- [ ] Run `bundle exec jekyll serve --incremental`
- [ ] Preview locally: `http://127.0.0.1:4000`

### 🔹 Syncing with upstream Academic Pages
If needed, check for upstream updates:
```bash
git remote add upstream https://github.com/academicpages/academicpages.github.io.git
git fetch upstream
git diff upstream/master  # preview changes
```
Manually merge only relevant improvements (themes, layouts, scripts).

---

## 🧩 Templates

Keep reusable templates in:
```
/templates/
  ├── post_template.md
  ├── paper_accepted_template.md
  ├── publication_template.md
```

Duplicate and adapt them as needed.

---

## ✅ General Policy

- Update `.bib` **only after Scopus indexing**.  
- Maintain **one post per paper or research update** (no duplicates).  
- Keep tone: clear, technical, and concise.  
- Focus on *evaluation* and *methodological coherence* across posts.  
- Prefer consistent tags (AI, Simulation, Privacy, Explainability, etc.).

---

_Last updated: October 2025_
