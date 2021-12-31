require './2021/day03.rb'

RSpec.describe Day03 do
  let(:input) {
    %w(00100 11110 10110 10111 10101 01111 00111 11100 10000 11001 00010 01010)
  }

  context 'Part 1' do
    subject { described_class.new(input).part1 }

    it { is_expected.to eq(198) }
  end
end
