require "active_support/all"
require 'cgi'
require 'nokogiri'
require 'open-uri'

module Helpers
  extend ActiveSupport::NumberHelper
end

module Jekyll
  class GoogleScholarCitationsTag < Liquid::Tag
    CITED_BY_REGEX = /Cited by\s+(\d[\d,]*)/i

    def initialize(tag_name, params, tokens)
      super
      splitted = params.split(" ").map(&:strip)
      @scholar_id = splitted[0]
      @article_id = splitted[1]

      if @scholar_id.nil? || @scholar_id.empty?
        puts "Invalid scholar_id provided"
      end

      if @article_id.nil? || @article_id.empty?
        puts "Invalid article_id provided"
      end
    end

    def render(context)
      article_id = resolve_param(context, @article_id)
      scholar_id = resolve_param(context, @scholar_id)
      article_url = google_scholar_article_url(scholar_id, article_id)

      begin
        citation_count = fetch_citation_count(article_url)
        puts "Fetched live Google Scholar citation count for #{article_id}: #{citation_count}" unless citation_count.nil?

        if citation_count.nil?
          citation_count = cached_citation_count(context, scholar_id, article_id)
          puts "Using cached Google Scholar citation count for #{article_id}" if citation_count
        end

        if citation_count.nil?
          citation_count = "N/A"
        else
          citation_count = format_citation_count(citation_count)
        end
      rescue Exception => e
        # Handle any errors that may occur during fetching
        citation_count = cached_citation_count(context, scholar_id, article_id)

        if citation_count.nil?
          citation_count = "N/A"
        else
          citation_count = format_citation_count(citation_count)
          puts "Using cached Google Scholar citation count for #{article_id}"
        end

        # Print the error message including the exception class and message
        puts "Error fetching citation count for #{article_id} in #{article_url}: #{e.class} - #{e.message}"
      end

      return "#{citation_count}"
    end

    private

    def resolve_param(context, param)
      raw_param = param.to_s.strip
      value = context[raw_param]
      value = raw_param if value.nil?
      value.to_s.strip
    end

    def google_scholar_article_url(scholar_id, article_id)
      citation_for_view = CGI.escape("#{scholar_id}:#{article_id}")
      "https://scholar.google.com/citations?view_op=view_citation&hl=en&user=#{CGI.escape(scholar_id)}&citation_for_view=#{citation_for_view}"
    end

    def fetch_citation_count(article_url)
      # Sleep for a random amount of time to avoid being blocked
      sleep(rand(1.5..3.5))

      doc = Nokogiri::HTML(
        URI.open(
          article_url,
          "User-Agent" => "Mozilla/5.0 (compatible; Jekyll citation badge; +https://github.com/ximiku/ximiku.github.io)",
          open_timeout: 10,
          read_timeout: 10
        )
      )

      metadata = doc.css('meta[name="description"], meta[property="og:description"]').map { |meta| meta["content"].to_s }
      page_looks_valid = doc.at_css("#gsc_oci_title") || doc.at_css('meta[property="og:title"]') || metadata.any?
      return nil unless page_looks_valid

      text_candidates = metadata
      text_candidates << doc.text
      match = text_candidates.map { |text| text.match(CITED_BY_REGEX) }.compact.first

      match ? match[1].delete(",").to_i : 0
    end

    def cached_citation_count(context, scholar_id, article_id)
      site = context.registers[:site]
      papers = site&.data&.dig("citations", "papers")
      return nil unless papers

      citation_entry = papers["#{scholar_id}:#{article_id}"] || papers[article_id]

      if citation_entry.nil?
        papers.each do |paper_key, paper_value|
          if paper_key.to_s.include?(article_id)
            citation_entry = paper_value
            break
          end
        end
      end

      return nil unless citation_entry

      citations = citation_entry["citations"] || citation_entry[:citations]
      citations.to_s.strip unless citations.nil?
    end

    def format_citation_count(citation_count)
      citation_count = citation_count.to_s.strip

      if citation_count.match?(/\A\d[\d,]*\z/)
        numeric_count = citation_count.delete(",").to_i
        Helpers.number_to_human(numeric_count, :format => '%n%u', :precision => 2, :units => { :thousand => 'K', :million => 'M', :billion => 'B' })
      else
        citation_count
      end
    end
  end
end

Liquid::Template.register_tag('google_scholar_citations', Jekyll::GoogleScholarCitationsTag)
