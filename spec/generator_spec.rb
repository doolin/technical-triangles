# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/generator'

RSpec.describe Generator do
  it 'compares output' do
    options = {
      ykyk_fill: 'lightgreen',
      ykydk_fill: 'lightblue',
      ydkydk_fill: 'pink',
      angle: 45,
      first_line_offset: 0.125,
      second_line_offset: 0.28
    }
    expected = File.read('spec/proofs/sswe.svg').to_s
    # TODO: will need to pass in a block for banners.
    described_class.write('/tmp/sswe.svg', options)
    actual = File.read('/tmp/sswe.svg').to_s

    expect(actual).to eq(expected)
  end
end
