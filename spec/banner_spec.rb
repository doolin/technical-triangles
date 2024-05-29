# frozen_string_literal: true

require 'spec_helper'
require_relative '../banner'

RSpec.describe Banner do
  it 'compares output' do
    expected = File.read('spec/proofs/banner.svg').to_s
    described_class.write(0, 0, outfile: '/tmp/banner.svg')
    actual = File.read('/tmp/banner.svg').to_s

    expect(actual).to eq(expected)
  end

  describe '#outline_path' do
    it 'returns the outline path' do
      banner = described_class.new(nil, 0, 0, width: 100, depth: 100, stroke_width: 2)
      expect(banner.outline_path).to eq('M 0,0 L 0,-100 L 50,-50 L 100,-100 L 100,0')
    end
  end

  describe '#top_line_path' do
    it 'returns the top line path' do
      banner = described_class.new(nil, 0, 0, width: 100, depth: 100, stroke_width: 2)
      expect(banner.top_line_path).to eq('M 1.0,2.0 L 1.0,-1.0 L 99.0,-1.0 L 99.0,2.0')
    end
  end
end
