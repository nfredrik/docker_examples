#!/usr/bin/env ruby 
require 'rubygems'
require 'rest-client'

#gem_name = ARGV[0]
gem_name = 'cucumber'

raise ArgumentError.new("gem name missing") if gem_name.nil?

response = RestClient.get("https://rubygems.org/gems/#{gem_name}")

puts response.inspect

if response.code == 200
  $stdout.puts 'Name  available.' 
else 
  $stdout.puts 'Name not available.' 
end
