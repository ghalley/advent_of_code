require './2021/day02.rb'

RSpec.describe Day02 do
  context 'Part 1' do
    let(:input) {
      [
        'forward 5',
        'down 5',
        'forward 8',
        'up 3',
        'down 8',
        'forward 2'
      ]
    }
    let(:new_object) { described_class.new(input) }

    subject { new_object.part1 }

    it 'begins position at 0' do
      new_object = described_class.new(input)
      expect(new_object.position).to eq(0)
      expect(new_object.depth).to eq(0)
    end

    it 'arrives at the correction coordinates' do
      subject
      expect(new_object.position).to eq(15)
      expect(new_object.depth).to eq(10)
    end

    it { is_expected.to eq(150) }
  end
end