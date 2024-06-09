#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/generator'

options = {
  ykyk_fill: 'lightgreen',
  ykydk_fill: 'lightblue',
  ydkydk_fill: 'pink',
  angle: 45,
  first_line_offset: 0.125,
  second_line_offset: 0.28
}
triangle = Generator.new(options).build do |xml, scale, banner_y, ykyk_fill|
  Banner.new(xml, scale + 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 3).draw
  Banner.new(xml, scale - 18, banner_y, fill: ykyk_fill, stroke: 'green', depth: 12).draw
  Banner.new(xml, scale - 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 19, width: 6).draw
end
File.write('images/sswe.svg', triangle.to_xml)

options = {
  ykyk_fill: 'lightgreen',
  ykydk_fill: 'lightblue',
  ydkydk_fill: 'pink',
  angle: 55,
  first_line_offset: 0.09,
  second_line_offset: 0.14
}
triangle = Generator.new(options).build do |xml, scale, banner_y, ykyk_fill|
  Banner.new(xml, scale + 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 3).draw
  Banner.new(xml, scale - 19, banner_y, fill: ykyk_fill, stroke: 'green', depth: 2).draw
  # Banner.new(xml, scale - 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 19, width: 6).draw
end
File.write('images/jswe.svg', triangle.to_xml)

options = {
  ykyk_fill: 'lightgreen',
  ykydk_fill: 'lightblue',
  ydkydk_fill: 'pink',
  angle: 35,
  first_line_offset: 0.09,
  second_line_offset: 0.32
}
triangle = Generator.new(options).build do |xml, scale, banner_y, ykyk_fill|
  Banner.new(xml, scale + 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 3).draw
  Banner.new(xml, scale + 19, banner_y, fill: ykyk_fill, stroke: 'green', depth: 2, width: 2).draw
  Banner.new(xml, scale - 19, banner_y, fill: ykyk_fill, stroke: 'green', depth: 2).draw
  Banner.new(xml, scale - 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 11, width: 2).draw
  Banner.new(xml, scale - 7, banner_y, fill: ykyk_fill, stroke: 'green', depth: 9, width: 2).draw
end
File.write('images/pswe.svg', triangle.to_xml)
