#!/usr/bin/env ruby
# frozen_string_literal: true

require 'nokogiri'

class Gradient
  attr_accessor :width, :height, :vertices, :gradient_colors, :gradient_center

  def initialize(width:, height:, vertices:, gradient_colors:, gradient_center:)
    @width = width
    @height = height
    @vertices = vertices
    @gradient_colors = gradient_colors
    @gradient_center = gradient_center
  end

  def build
  end

  def generate_svg
    result = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.svg(xmlns: 'http://www.w3.org/2000/svg', width: @width, height: @height) {
        xml.defs {
          xml.radialGradient(id: 'vertexGradient', cx: @gradient_center[:x], cy: @gradient_center[:y], r: '100', fx: @gradient_center[:x], fy: @gradient_center[:y]) {
            @gradient_colors.each do |offset, color|
              xml.stop(offset: offset, 'stop-color' => color)
            end
          }
        }
        xml.polygon(points: @vertices.map { |v| "#{v[:x]},#{v[:y]}" }.join(' '), fill: 'url(#vertexGradient)')
      }
    end.to_xml
    File.write('gradient.svg', result)
  end
end

# Define triangle vertices and gradient details
vertices = [{x: 50, y: 50}, {x: 150, y: 50}, {x: 100, y: 150}]
# gradient_colors = {'0%' => '#ff0000', '100%' => '#0000ff'}
gradient_colors = {'40%' => '#ff0000', '50%' => '#0000ff'}
gradient_center = {x: 50, y: 50}

# Create an instance of the Gradient class
svg_creator = Gradient.new(
  width: 200,
  height: 200,
  vertices: vertices,
  gradient_colors: gradient_colors,
  gradient_center: gradient_center
)

# Generate SVG
svg_content = svg_creator.generate_svg
# puts svg_content
