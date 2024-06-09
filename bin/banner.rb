#!/usr/bin/env ruby
# frozen_string_literal: true

require 'nokogiri'
require_relative '../lib/banner'

options = { outfile: '/tmp/banner.svg' }
Banner.write(0, 0, options)
