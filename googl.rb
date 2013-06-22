#!/usr/bin/env ruby

require 'optparse'
require 'optparse/uri'
require 'rest-client'
require 'json'

def run url
	result = RestClient.post 'https://www.googleapis.com/urlshortener/v1/url', 
	{:longUrl => url}.to_json, :content_type => :json, :accept => :json
	output = JSON.parse(result)
	puts "=============================="
	puts "Short URL: #{output['id']}"
	puts "==============================" 
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: googl.rb [options]"

  opts.on("--url URL", URI, "URL") do |url|
    options[:url] = url
    run url
  end
end.parse!

