#!/usr/bin/env ruby
# Genera una pagina in _authors/ per ciascun autore presente nel .bib
require 'fileutils'
require 'bibtex'

BIB_PATH   = ENV['BIB_PATH']   || '_bibliography/papers.bib'
OUT_DIR    = ENV['OUT_DIR']    || '_authors'
TEMPLATE   = ENV['TEMPLATE']   || nil  # opzionale: se vuoi usare un file sorgente

abort "Missing #{BIB_PATH}" unless File.exist?(BIB_PATH)

# slugify simile a Liquid 'slugify' default
def slugify(str)
  str.to_s.downcase
     .gsub(/[^\p{Alnum}\s-]/u, '')  # rimuovi tutto tranne alnum/space/-
     .gsub(/\s+/, '-')               # spazi -> -
     .gsub(/-+/, '-')                # collapse -
     .gsub(/^-|-$/, '')              # trim -
end

bib = BibTeX.open(BIB_PATH)

authors = []
bib.each do |e|
  next unless e.respond_to?(:author) && e.author
  e.author.each do |person|
    full = [person.first, person.von, person.last, person.jr].compact.join(' ').gsub(/\s+/, ' ').strip
    authors << full unless full.empty?
  end
end

authors = authors.uniq.sort
FileUtils.mkdir_p(OUT_DIR)

authors.each do |name|
  slug = slugify(name)
  path = File.join(OUT_DIR, "#{slug}.md")

  front = <<~YAML
  ---
  layout: single
  title: "Publications by #{name}"
  # Essendo in _authors/ questa pagina appartiene alla collection "authors"
  # Il permalink finale seguirà /:collection/:path/ => /authors/#{slug}/
  author: "#{name}"
  author_profile: true
  toc: false
  ---
  YAML

  body =
    if TEMPLATE && File.exist?(TEMPLATE)
      # Se vuoi usare un template esterno, rimpiazza placeholder {{AUTHOR_NAME}}
      File.read(TEMPLATE).gsub('{{AUTHOR_NAME}}', name)
    else
      # Template inline: filtra per autore con jekyll-scholar
      <<~MD
      # Publications by “#{name}”

      {% raw %}{% bibliography --query @*[author~=#{name}] --template bibliography_item --details %}{% endraw %}

      <p><a href="{{ '/publications/' | relative_url }}">← Back to all publications</a></p>
      MD
    end

  File.write(path, front + "\n" + body)
end

puts "Generated #{authors.size} author pages in #{OUT_DIR}/"