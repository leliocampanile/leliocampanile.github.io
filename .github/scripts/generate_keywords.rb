#!/usr/bin/env ruby
# frozen_string_literal: true

require "bibtex"
require "fileutils"
require "json"  # <— aggiungi

SRC_DIR = "_bibliography"
BIBFILE = ENV.fetch("BIBFILE", "papers.bib")
PATH    = File.join(SRC_DIR, BIBFILE)
OUT_DIR = "_keywords"

def slugify(str)
  s = str.to_s.downcase.strip
  s = s.gsub(/[^\p{Alnum}]+/u, "-")
  s.gsub(/^-+|-+$/, "")
end

# helper per front matter YAML-safe
def y(str) JSON.dump(str.to_s) end   # restituisce una stringa tra doppi apici con escape corretto

abort("BibTeX file not found: #{PATH}") unless File.exist?(PATH)

bib = BibTeX.open(PATH)

counts = Hash.new(0)
bib.each do |e|
  next unless e.respond_to?(:[])
  raw = [e[:keywords], e[:author_keywords]].compact.map(&:to_s).join(",")
  next if raw.strip.empty?
  raw.split(/[;,]/).map(&:strip).reject(&:empty?).each { |k| counts[k] += 1 }
end

FileUtils.mkdir_p(OUT_DIR)
Dir.glob(File.join(OUT_DIR, "*.md")).each { |f| File.delete(f) }

counts.keys.sort.each do |kw|
  slug = slugify(kw)
  path = File.join(OUT_DIR, "#{slug}.md")
  title = "Publications tagged with #{kw}"

  File.write(path, <<~MD)
    ---
    layout: keyword
    title: #{y(title)}
    keyword: #{y(kw)}
    permalink: /keywords/#{slug}/
    ---

    {% bibliography --group_by year --group_order descending --template bibliography_item --details --query "@*[keywords~=#{kw}]" %}

    <p><a href="{{ '/publications/' | relative_url }}">← Back to all publications</a></p>
  MD
end

puts "Generated #{counts.size} keyword pages in #{OUT_DIR}/"