#!/usr/bin/env ruby

require 'nokogiri'
require_relative '../banner'

# outfile = './banner.svg'
# options = { outfile: './banner.svg' }

# banner = Nokogiri::XML::Builder.new do |xml|
#   xml.svg do
#     Banner.new(xml, 0, 0, options).draw
#   end
# end

# File.open(outfile, 'w') { |f| f.write(banner.to_xml) }

options = { outfile: '/tmp/banner.svg' }
Banner.write(0, 0, options)
