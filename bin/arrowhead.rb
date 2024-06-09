#!/usr/bin/env ruby
# frozen_string_literal: true

require 'nokogiri'
require_relative '../lib/arrowhead'

options = { outfile: '/tmp/arrowhead.svg' }
Arrowhead.write(options)
