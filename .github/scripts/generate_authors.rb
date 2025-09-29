#!/usr/bin/env ruby
require 'fileutils'
require 'bibtex'

BIB_PATH   = ENV['BIB_PATH']   || '_bibliography/papers.bib'
OUT_DIR    = ENV['OUT_DIR']    || '_authors'
TEMPLATE   = ENV['TEMPLATE']   || '_pages/author_template.md'

abort "Missing #{BIB_PATH}" unless File.exist?(BIB_PATH)
abort "Missing #{TEMPLATE}"  unless File.exist?(TEMPLATE)

bib = BibTeX.open(BIB_PATH)

# Raccogli autori unici
authors = []
bib.each do |e|
  next unless e.respond_to?(:author) && e.author
  # BibTeX-ruby sa già splittare "and"
  e.author.each do |person|
    full = [person.first, person.von, person.last, person.jr].compact.join(' ').gsub(/\s+/, ' ').strip
    authors << full unless full.empty?
  end
end
authors = authors.uniq.sort

FileUtils.mkdir_p(OUT_DIR)

def slugify(str)
  str.downcase
     .gsub(/[^\p{Alnum}\s-]/u, '')
     .gsub(/\s+/, '-')
     .gsub(/-+/, '-')
end

template = File.read(TEMPLATE)

authors.each do |name|
  slug = slugify(name)
  path = File.join(OUT_DIR, "#{slug}.md")
  front = <<~YAML
  ---
  layout: single
  title: "Publications by #{name}"
  permalink: /author/#{slug}/
  author: "#{name}"
  author_profile: true
  ---
  YAML

  body = <<~MD
  # Publications by “#{name}”

  {% raw %}{% bibliography --query @*[author~=#{name}] --template bibliography_item --details %}{% endraw %}

  <p><a href="{{ '/publications/' | relative_url }}">← Back to all publications</a></p>
  MD

  File.write(path, front + "\n" + body)
end

puts "Generated #{authors.size} author pages in #{OUT_DIR}/"
