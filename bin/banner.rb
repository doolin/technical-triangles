#!/usr/bin/env ruby

require 'nokogiri'
require_relative '../banner'

options = { outfile: '/tmp/banner.svg' }
Banner.write(0, 0, options)
