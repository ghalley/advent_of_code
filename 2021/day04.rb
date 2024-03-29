require 'matrix'

class Board
  attr_accessor :grid, :matches

  def initialize(input)
    input.chomp!
    rows = input.split("\n").map { |row| row.split(' ') }
    @grid = Matrix.build(rows.count, rows.first.count) {|row, col| rows[row][col] }
    @matches = []
  end

  def match(number)
    @grid.each_with_index do |e, row, col|
      next unless e == number

      @matches << [row, col]
    end
  end

  def bingo?
    rows = matches.map(&:first).tally
    columns = matches.map(&:last).tally

    rows.values.any? {|r| r==5} ||
      columns.values.any? {|r| r==5}
  end

  def score
    numbers = []
    @grid.each_with_index do |e, row, col|
      next if @matches.include?([row, col])

      numbers << e.to_i
    end
    numbers.reduce(:+)
  end
end

class Game
  attr_accessor :boards, :turns, :current_turn

  def initialize(input)
    input_array = input.split("\n\n")
    @turns = input_array.first.split(',')
    @boards = input_array[1..].map do |board_input|
      Board.new(board_input)
    end
    @current_turn = 0
  end

  def find_winner(number)
    boards_to_play = @boards.reject(&:bingo?)
    boards_to_play.select do |board|
      board.match(number)
      board.bingo?
    end
  end

  def play(number_of_turns: nil, part2: nil)
    total_turns = number_of_turns || turns.count
    winning_scores = []
    @turns[@current_turn, total_turns].each do |turn_value|
      winners = find_winner(turn_value)
      next if winners.empty?

      winning_scores << process_winner(winners.last, turn_value)
    end
    part2 ? winning_scores.last : winning_scores.first
  end

  def process_winner(board, winning_number)
    board.score * winning_number.to_i
  end
end

input = File.read('2021/inputs/day04.txt')
game = Game.new(input)
part1 = game.play
puts "Day 4-1: #{part1}"

game = Game.new(input)
part2 = game.play(part2: true)
puts "Day 4-2: #{part2}"
