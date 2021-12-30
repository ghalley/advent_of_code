require './2021/day01.rb'

RSpec.describe Day01 do
  let(:input) {
    [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
  }

  context "Part 1" do
    subject { described_class.new(input).part1 }

    it { is_expected.to eq(7)}
  end

  context "Part 2" do
    subject { described_class.new(input).part2 }

    it { is_expected.to eq(5)}
  end
end