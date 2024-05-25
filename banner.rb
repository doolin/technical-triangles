# frozen_string_literal: true

# Banner element is used for technical depth.
class Banner
  attr_accessor :xml
  attr_reader :options, :x_off, :y_off

  def initialize(xml, x_off, y_off, options = {})
    @xml = xml
    @x_off = x_off
    @y_off = y_off
    @options = options
  end

  def stroke_width
    options[:stroke_width] || '0.9'
  end

  def fill
    options[:fill] || 'none'
  end

  def stroke
    options[:stroke] || 'black'
  end

  # TODO: make a few of these and choose them randomly
  # or based on some criteris.
  def width
    options[:width] || 4
  end

  # TODO: This needs to be proportional to the distance between
  # the line of stuff you and and the line for stuff you
  # know you don't know.
  def depth
    options[:depth] || 6
  end

  def stroke_color
    options[:stroke_color] || 'black'
  end

  def fill_color
    options[:fill_color] || 'none'
  end

  # TODO: replace this with a line of appropriate length
  # and stroke width. The box works, but it's too complicated
  # to explain or maintain.
  #   a  e
  #   |  |
  #   b  d
  def top_line
    a_x = 0 + x_off + (stroke_width.to_f / 2)
    a_y = 0 + y_off - (0 + stroke_width.to_f)

    b_x = 0 + x_off + (stroke_width.to_f / 2)
    # b_y = depth + y_off
    b_y = y_off + (stroke_width.to_f / 2)

    d_x = width + x_off - (stroke_width.to_f / 2)
    # d_y = depth + y_off
    d_y = y_off + (stroke_width.to_f / 2)

    e_x = width + x_off - (stroke_width.to_f / 2)
    e_y = 0 + y_off - (0 + stroke_width.to_f)

    d = "M #{a_x},#{-a_y} L #{b_x},#{-b_y} L #{d_x},#{-d_y} L #{e_x},#{-e_y}"

    xml.path(d:, fill:, 'stroke-width': 0, stroke: 'blue', id: 'banner')
  end

  #   a  e
  #   |  |
  #   | c|
  #   |/\|
  #   b  d
  def outline
    a_x = 0 + x_off
    a_y = 0 + y_off
    b_x = 0 + x_off
    b_y = depth + y_off

    c_x = (width / 2) + x_off
    c_y = depth - (width / 2) + y_off

    d_x = width + x_off
    d_y = depth + y_off
    e_x = width + x_off
    e_y = 0 + y_off
    d = "M #{a_x},#{-a_y} L #{b_x},#{-b_y} L #{c_x},#{-c_y} L #{d_x},#{-d_y} L #{e_x},#{-e_y}"

    xml.path(d:, fill:, 'stroke-width': stroke_width, stroke:, id: 'banner')
  end

  def draw
    xml.g do
      outline
      top_line
    end
  end
end
