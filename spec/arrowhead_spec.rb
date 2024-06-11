# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/arrowhead'

RSpec.describe Arrowhead do
  it 'compares output' do
    expected = File.read('proofs/arrowhead.svg').to_s
    described_class.write(outfile: '/tmp/arrowhead.svg')
    actual = File.read('/tmp/arrowhead.svg').to_s

    expect(actual).to eq(expected)
  end

  describe '#outline' do
    it 'draws an arrowhead path' do
      arrowhead = described_class.new(nil)
      expect(arrowhead.outline).to eq('M 5,25 L 0,40 L 40,25 L 0,10 Z')
    end
  end
end
