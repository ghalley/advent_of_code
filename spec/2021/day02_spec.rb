require './2021/day02.rb'

RSpec.describe Day02 do
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

  context 'Part 1' do
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

  context 'Part 2' do
    subject { new_object.part2 }

    it 'begins position at 0' do
      new_object = described_class.new(input)
      expect(new_object.position).to eq(0)
      expect(new_object.depth).to eq(0)
      expect(new_object.aim).to eq(0)
    end

    it 'arrives at the correct coordinates' do
      subject
      expect(new_object.position).to eq(15)
      expect(new_object.depth).to eq(60)
      expect(new_object.aim).to eq(10)
    end

    it { is_expected.to eq(900) }
  end
end