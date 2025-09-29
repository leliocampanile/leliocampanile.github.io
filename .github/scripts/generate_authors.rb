#!/usr/bin/env ruby
require 'fileutils'
require 'bibtex'

BIB_PATH = ENV['BIB_PATH'] || '_bibliography/papers.bib'
OUT_DIR  = ENV['OUT_DIR']  || '_authors'

abort "Missing #{BIB_PATH}" unless File.exist?(BIB_PATH)
FileUtils.mkdir_p(OUT_DIR)

def slugify(str)
  str.to_s.downcase
     .gsub(/[^\p{Alnum}\s-]/u, '')
     .gsub(/\s+/, '-')
     .gsub(/-+/, '-')
     .gsub(/^-|-$/, '')
end

bib = BibTeX.open(BIB_PATH)

# Mappa: slug -> { author: "First von Last", query: "von last" }
authors = {}

bib.each do |e|
  next unless e.respond_to?(:author) && e.author
  e.author.each do |p|
    first = [p.first].compact.join(' ').strip
    # token di ricerca: "von last" (es. "Di Bonito")
    query = [p.von, p.last].compact.join(' ').gsub(/\s+/, ' ').strip
    display = [first, p.von, p.last, p.jr].compact.join(' ').gsub(/\s+/, ' ').strip
    next if display.empty?

    slug = slugify(display)
    authors[slug] ||= { 'author' => display, 'query' => query }
  end
end

authors.each do |slug, data|
  name  = data['author']
  query = data['query'].empty? ? name.split.last : data['query'] # fallback: ultimo token

  front = <<~YAML
  ---
  layout: single
  title: "Publications by #{name}"
  author: "#{name}"
  author_query: "#{query}"
  author_profile: true
  toc: false
  permalink: /authors/#{slug}/
  ---
  YAML

  body = <<~MD
  # Publications by "#{name}"

  {% bibliography --group_by year --group_order descending --template bibliography_item --details --query @*[author~="{{ page.author_query }}"] %}

  <p><a href="{{ '/publications/' | relative_url }}">← Back to all publications</a></p>
  MD

  File.write(File.join(OUT_DIR, "#{slug}.md"), front + "\n" + body)
end

puts "Generated #{authors.size} author pages in #{OUT_DIR}/"