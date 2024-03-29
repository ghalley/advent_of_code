require './2021/day05.rb'

RSpec.describe Day05 do
  let(:input) do
    [
      "0,9 -> 5,9",
      "8,0 -> 0,8",
      "9,4 -> 3,4",
      "2,2 -> 2,1",
      "7,0 -> 7,4",
      "6,4 -> 2,0",
      "0,9 -> 2,9",
      "3,4 -> 1,4",
      "0,0 -> 8,8",
      "5,5 -> 8,2"
    ]
  end
  subject { described_class.new(input).part1 }

  it { is_expected.to eq(5) }

end
