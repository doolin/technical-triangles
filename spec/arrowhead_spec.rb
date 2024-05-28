# frozen_string_literal: true

require 'spec_helper'
require_relative '../arrowhead'

RSpec.describe Arrowhead do
  it 'compares output' do
    expected = File.read('spec/proofs/arrowhead.svg').to_s
    described_class.write(outfile: '/tmp/arrowhead.svg')
    actual = File.read('/tmp/arrowhead.svg').to_s

    expect(actual).to eq(expected)
  end
end
