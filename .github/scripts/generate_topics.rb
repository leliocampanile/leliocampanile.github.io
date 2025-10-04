#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'fileutils'

TOPICS_JSON = ENV['TOPICS_JSON'] || '_data/topic_keywords.json'
OUT_DIR     = '_topics'

abort "Missing #{TOPICS_JSON}" unless File.exist?(TOPICS_JSON)

def slugify(str)
  str.to_s.downcase
    .gsub(/[^\p{Alnum}\s-]/u, '-') # tutto ciò che non è alfanumerico/space -> '-'
    .gsub(/\s+/, '-')              # spazi -> '-'
    .gsub(/-+/, '-')               # collapse --
    .gsub(/^-|-$/, '')             # trim -
end

data = JSON.parse(File.read(TOPICS_JSON))

FileUtils.mkdir_p(OUT_DIR)

generated = 0
data.each do |topic_name, keywords|
  # normalizza e filtra keyword vuote/duplicate
  kws = Array(keywords).map { |k| k.to_s.strip }.reject(&:empty?).uniq
  next if kws.empty?

  # Costruisci la regex OR per jekyll-scholar (case-sensitive, senza virgolette)
  regex_or = kws.join('|')

  slug = slugify(topic_name)
  path = File.join(OUT_DIR, "#{slug}.md")

  front_matter = <<~YAML
  ---
  layout: topic
  title: "Topic: #{topic_name}"
  topic: "#{topic_name}"
  keywords:
  #{kws.map { |k| "  - #{k}" }.join("\n")}
  regex_query: #{regex_or}
  permalink: /topics/#{slug}/
  author_profile: true
  ---
  YAML

  body = <<~MD

  {% comment %} Lista delle keyword accorpate in questo topic {% endcomment %}
  <p class="topic-tags">
#{kws.map { |k| %Q{<a class="pub-tag" href="#">#{k}</a>} }.join(" ")}
  </p>

  {% comment %} Bibliografia filtrata per qualsiasi keyword del topic {% endcomment %}
  {% bibliography --group_by year --group_order descending --template bibliography_item --query @*[keywords~=#{'{{ page.regex_query }}'}] %}

  <p><a href="{{ '/publications/' | relative_url }}">← Back to all publications</a></p>
  MD

  File.write(path, front_matter + "\n" + body)
  generated += 1
end

puts "Generated #{generated} topic pages in #{OUT_DIR}/"