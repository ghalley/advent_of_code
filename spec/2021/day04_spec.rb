require './2021/day04.rb'

RSpec.describe Board do
  let(:board_input) {
    "22 13 17 11  0\n8  2 23  4 24\n21  9 14 16  7\n6 10  3 18  5\n1 12 20 15 19"
  }

  it 'stores the input correctly when initialized' do
    board = Board.new(board_input)
    expect(board.grid).to be_a(Matrix)
    expect(board.grid[0,0]).to eq('22')
  end

  describe '#match' do
    let(:number) {'2'}
    let(:board) { described_class.new(board_input) }

    subject { board.match(number)}

    it 'begins with no matches' do
      board = Board.new(board_input)
      expect(board.matches).to be_empty
    end

    it 'adds the coordinates to #matches' do
      subject
      expect(board.matches).to eq([[1, 1]])
    end
  end

  describe '#bingo?' do
    let(:board) { described_class.new(board_input) }
    subject { board.bingo? }

    it { is_expected.to be_falsey }

    context 'with a winning set of rows' do
      before do
        board.matches = [
          [0,1],
          [0,2],
          [0,3],
          [0,4],
          [0,5]
        ]
      end

      it { is_expected.to be_truthy }
    end
  end

  describe "#score" do
    let(:winning_input) {
      "14 21 17 24  4\n10 16 15  9 19\n18  8 23 26 20\n22 11 13  6  5\n 2  0 12  3  7"
    }

    let(:board) { described_class.new(winning_input) }

    subject { board.score }

    before do
      board.matches = [
        [0,0],
        [0,1],
        [0,2],
        [0,3],
        [0,4],
        [1,3],
        [2,2],
        [3,1],
        [3,4],
        [4,0],
        [4,1],
        [4,4]
      ]
    end

    it { is_expected.to eq(188) }
  end
end

RSpec.describe Game do
  let(:game_input) {
    "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1\n\n22 13 17 11  0\n8  2 23  4 24\n21  9 14 16  7\n6 10  3 18  5\n1 12 20 15 19\n\n3 15  0  2 22\n9 18 13 17  5\n19  8  7 25 23\n20 11 10 24  4\n14 21 16 12  6\n\n14 21 17 24  4\n10 16 15  9 19\n18  8 23 26 20\n22 11 13  6  5\n2  0 12  3  7\n"
  }
  let(:turns) {
    game_input.split("\n\n").first.split(',')
  }

  describe "#new" do
    subject { described_class.new(game_input) }

    it "stores the turns correctly" do
      expect(subject.turns).to eq(turns)
    end

    it "stores the boards correctly" do
      game = subject
      expect(game.boards.count).to eq(3)
      expect(game.boards.first).to be_a(Board)
    end
  end

  describe "#find_winner" do
    let(:game) { described_class.new(game_input) }
    let(:number) { '7' }

    subject { game.find_winner(number) }

    it 'changes the boards' do
      subject
      expect(game.boards.map(&:matches).map(&:length)).to eq([1,1,1])
    end

    it { is_expected.to be_empty }

    context "with a winning board" do
      let(:number) { '4' }

      before do
        game.boards.last.matches = [
          [0,0],
          [0,1],
          [0,2],
          [0,3],
          [1,3],
          [2,2],
          [3,1],
          [3,4],
          [4,0],
          [4,1],
          [4,4]
        ]
      end

      it 'returns the winning board'do
        board = subject.first
        expect(board).to be_a(Board)
        expect(board.score).to eq(188)
      end
    end
  end

  describe '#play' do
    let(:game) { described_class.new(game_input) }
    let(:board_matches) do
      [
        [[0, 3],  [1, 3],  [2, 1],  [2, 4], [3, 4]],
        [[1, 0],  [1, 4],  [2, 2],  [3, 1], [3, 4]],
        [[0, 4],  [1, 3],  [3, 1],  [3, 4], [4, 4]]
      ]
    end

    subject { game.play(number_of_turns) }

    context 'first 5 turns' do
      let(:number_of_turns) { 5 }

      it 'changes the boards correctly' do
        subject
        game.boards.each_with_index do |board, index|
          expect(board.matches).to match_array(board_matches[index])
        end
      end

      context 'full game' do
        let(:number_of_turns) { nil }

        it { is_expected.to eq(4512) }
      end
    end
  end
end
