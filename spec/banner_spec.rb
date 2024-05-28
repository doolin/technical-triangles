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
end
