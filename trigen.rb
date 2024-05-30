#!/usr/bin/env ruby
# frozen_string_literal: true

require 'nokogiri'
require_relative 'banner'
require_relative 'arrowhead'

# TODO: a short list
# 1. Group elements logically.
# 2. marker-mid for specialiites: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker-mid
# 3. Add id attributes to all relevant elements.
# 4. Move drawing to their own functions like hexagon.

# Parameterize the technical depth triangle from
# the book "Fundamnentals of Software Architecture"
class Trigen
  BASELINE = 100
  GAP = 3
  ARROW_GAP = 2
  FONT_SIZE = 6
  SCALE_FACTOR = 2.4
  PADDING = 10

  def initialize(options = {})
    @options = options
  end

  def r2d(radians)
    radians * Math::PI / 180
  end

  def resize(value)
    2 * BASELINE * value
  end

  # bxr = bottom x right, etc
  def triangle(offset)
    bxr = resize(offset)
    bxl = resize(1 - offset)
    by = bxr * Math.tan(r2d(angle))
    xe = BASELINE
    ye = xe * Math.tan(r2d(angle))

    format('M %<bxr>.4f,%<by>.4f L %<bxl>.4f,%<by>.4f L %<xe>.4f,%<ye>.4f Z',
      bxr:, by:, bxl:, xe:, ye:)
  end

  # The base of the red triangle is 2*BASELINE.
  def red_triangle
    {
      d: triangle(0.0),
      fill: ydkydk_fill,
      'stroke-width' => '1.0',
      stroke: 'red',
      id: 'ydk-ydk'
    }
  end

  def blue_triangle
    {
      d: triangle(first_line_offset),
      fill: ykydk_fill,
      'stroke-width' => '1.0',
      stroke: 'blue',
      id: 'yk-ydk'
    }
  end

  def green_triangle
    {
      d: triangle(second_line_offset),
      fill: ykyk_fill,
      'stroke-width' => '1.0',
      stroke: 'green',
      id: 'yk-yk'
    }
  end

  def first_line_offset
    @options[:first_line_offset] || 0.125
  end

  def second_line_offset
    @options[:second_line_offset] || 0.28
  end

  def angle
    @options[:angle] || 45
  end

  def ykyk_fill
    @options[:ykyk_fill] || 'none'
  end

  def ykydk_fill
    @options[:ykydk_fill] || 'none'
  end

  def ydkydk_fill
    @options[:ydkydk_fill] || 'none'
  end

  def breadth_line_left
    x1 = resize(first_line_offset) + ARROW_GAP
    x2 = BASELINE - 32
    y1 = y2 =   (BASELINE * Math.tan(r2d(angle))) + 15

    { x1:, y1:, x2:, y2:, stroke: 'black', 'stroke-width': '0.5', 'marker-start': 'url(#arrowhead)' }
  end

  def breadth_line_right
    x2 = resize(1 - first_line_offset) - ARROW_GAP
    x1 = BASELINE + 34
    y1 = y2 =   (BASELINE * Math.tan(r2d(angle))) + 15

    { x1:, y1:, x2:, y2:, stroke: 'black', 'stroke-width': '0.5', 'marker-end': 'url(#arrowhead)' }
  end

  def depth_bracket_top
    x1 = resize(first_line_offset) + ARROW_GAP + GAP
    xe = BASELINE
    x2 = xe - GAP
    y1 = y2 = BASELINE * Math.tan(r2d(angle))

    { x1:, y1:, x2:, y2:, stroke: 'black', 'stroke-width': '0.5' }
  end

  def banner_y
    -resize(second_line_offset) * Math.tan(r2d(angle))
  end

  def depth_bracket_bottom
    x1 = resize(first_line_offset) + ARROW_GAP + GAP
    xe = resize(second_line_offset)
    x2 = xe - GAP
    y1 = y2 = xe * Math.tan(r2d(angle))

    { x1:, y1:, x2:, y2:, stroke: 'black', 'stroke-width': '0.5' }
  end

  def depth_arrows
    xe = resize(second_line_offset)
    y = (xe * Math.tan(r2d(angle))) # - GAP
    x1 = x2 = (0.5 * BASELINE) - 12

    # This is the bottom arrowhead
    y1 = y + ARROW_GAP

    # Top arrowhead
    y2 = (BASELINE * Math.tan(r2d(angle))) - ARROW_GAP

    {
      x1:,
      y1:,
      x2:,
      y2:,
      stroke: 'black',
      'stroke-width': '0.5',
      'marker-end': 'url(#arrowhead)',
      'marker-start': 'url(#arrowhead)'
    }
  end

  def height
    0.5
  end

  def breadth_bracket_left
    offset = first_line_offset

    x1 = resize(offset)
    y1 = (x1 * Math.tan(r2d(angle))) + GAP
    x2 = x1
    y2 = (BASELINE * Math.tan(r2d(angle))) + 30

    { x1:, y1:, x2:, y2:, stroke: 'black', 'stroke-width': '0.5' }
  end

  def breadth_bracket_right
    offset = first_line_offset

    x1 = resize(1 - offset)
    y1 = (resize(offset) * Math.tan(r2d(angle))) + GAP
    x2 = x1
    y2 = (BASELINE * Math.tan(r2d(angle))) + 30

    { x1:, y1:, x2:, y2:, stroke: 'black', 'stroke-width': '0.5' }
  end

  def stuff_you_know
    xe = resize(second_line_offset)
    y = -(xe * Math.tan(r2d(angle))) - GAP

    {
      x: BASELINE,
      y:,
      'font-family': 'Arial',
      'font-size': FONT_SIZE,
      'text-anchor': 'middle',
      fill: 'black',
      transform: 'scale(1 -1)'
    }
  end

  def yk_ydk
    xe = resize(first_line_offset)
    y = -(xe * Math.tan(r2d(angle))) - GAP

    {
      x: BASELINE,
      y:,
      'font-family': 'Arial',
      'font-size': FONT_SIZE,
      'text-anchor': 'middle',
      fill: 'black',
      transform: 'scale(1 -1)'
    }
  end

  def ydk_ydk
    {
      x: BASELINE,
      y: '56',
      'font-family': 'Arial',
      'font-size': FONT_SIZE,
      'text-anchor': 'middle',
      fill: 'black',
      transform: 'scale(1 -1) translate(0 -60)'
    }
  end

  def technical_breadth
    y = (-BASELINE * Math.tan(r2d(angle))) + 47

    {
      x: BASELINE,
      y:,
      'font-family': 'Arial',
      'font-size': FONT_SIZE,
      'text-anchor': 'middle',
      fill: 'black',
      transform: 'scale(1 -1) translate(0 -60)'
    }
  end

  def technical_depth
    {
      x: (0.5 * BASELINE) - 10,
      y: (-((BASELINE / 2) + BASELINE) / 2 * Math.tan(r2d(angle))) - 5,
      'font-family': 'Arial',
      'font-size': FONT_SIZE,
      fill: 'black',
      transform: 'scale(1 -1)',
      'text-anchor': 'start',
      'marker-end': 'url(#arrowhead)'
    }
  end

  def image_height
    BASELINE + (Math.tan(r2d(angle)) * BASELINE) - 50
  end

  def image_width
    (BASELINE + PADDING) * 2
  end

  def svg_attrs
    {
      xmlns: 'http://www.w3.org/2000/svg',
      width: image_width * SCALE_FACTOR,
      height: image_height * SCALE_FACTOR
      # viewBox: '0 0 500 500'
    }
  end

  def transform
    width = PADDING * SCALE_FACTOR
    height = (image_height * SCALE_FACTOR) - 15
    "translate(#{width},#{height}) scale(#{SCALE_FACTOR} -#{SCALE_FACTOR})"
  end

  def build
    Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.svg(svg_attrs) do
        xml.rect(width: '100%', height: '100%', fill: 'none')
        # An explicit bounding box to help me do the calculations.
        # xml.rect(x: '100', y: '50', width: bb_width, height: bb_height, fill: 'lightgreen')

        xml.g(transform:) do
          xml.defs do
            Arrowhead.new(xml).build
          end

          xml.path(red_triangle)
          xml.path(blue_triangle)
          xml.path(green_triangle)
          xml.text_('Stuff you know', stuff_you_know)
          xml.text_("Stuff you know you don't know", yk_ydk)
          xml.text_("Stuff you don't know you don't know", ydk_ydk)

          yield(xml, BASELINE, banner_y, ykyk_fill) if block_given?

          xml.g(id: 'technical-depth') do
            xml.line(depth_bracket_top)
            xml.line(depth_bracket_bottom)
            xml.line(depth_arrows)
            xml.text_(technical_depth) do
              xml.tspan('Technical', dx: 0, dy: 0)
              xml.tspan('Depth', dx: -24, dy: 7)
            end
          end
          xml.g(id: 'technical-breadth') do
            xml.line(breadth_bracket_left)
            xml.line(breadth_bracket_right)
            xml.line(breadth_line_left)
            xml.line(breadth_line_right)
            xml.text_('Technical breadth', technical_breadth)
          end
        end
      end
    end
  end
end

options = {
  ykyk_fill: 'lightgreen',
  ykydk_fill: 'lightblue',
  ydkydk_fill: 'pink',
  angle: 45,
  first_line_offset: 0.125,
  second_line_offset: 0.28
}
trigen = Trigen.new(options).build do |xml, scale, banner_y, ykyk_fill|
  Banner.new(xml, scale + 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 3).draw
  Banner.new(xml, scale - 18, banner_y, fill: ykyk_fill, stroke: 'green', depth: 12).draw
  Banner.new(xml, scale - 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 19, width: 6).draw
end
File.write('images/sswe.svg', trigen.to_xml)

options = {
  ykyk_fill: 'lightgreen',
  ykydk_fill: 'lightblue',
  ydkydk_fill: 'pink',
  angle: 55,
  first_line_offset: 0.09,
  second_line_offset: 0.14
}
trigen = Trigen.new(options).build do |xml, scale, banner_y, ykyk_fill|
  Banner.new(xml, scale + 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 3).draw
  Banner.new(xml, scale - 19, banner_y, fill: ykyk_fill, stroke: 'green', depth: 2).draw
  # Banner.new(xml, scale - 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 19, width: 6).draw
end
File.write('images/jswe.svg', trigen.to_xml)

options = {
  ykyk_fill: 'lightgreen',
  ykydk_fill: 'lightblue',
  ydkydk_fill: 'pink',
  angle: 35,
  first_line_offset: 0.09,
  second_line_offset: 0.32
}
trigen = Trigen.new(options).build do |xml, scale, banner_y, ykyk_fill|
  Banner.new(xml, scale + 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 3).draw
  Banner.new(xml, scale + 19, banner_y, fill: ykyk_fill, stroke: 'green', depth: 2, width: 2).draw
  Banner.new(xml, scale - 19, banner_y, fill: ykyk_fill, stroke: 'green', depth: 2).draw
  Banner.new(xml, scale - 10, banner_y, fill: ykyk_fill, stroke: 'green', depth: 11, width: 2).draw
  Banner.new(xml, scale - 7, banner_y, fill: ykyk_fill, stroke: 'green', depth: 9, width: 2).draw
end
File.write('images/pswe.svg', trigen.to_xml)
