class Day02
  attr_accessor :position, :depth

  def initialize(input)
    @input = input
    @position = 0
    @depth = 0
  end

  def part1
    @input.each {|line| move(line)}
    @position * @depth
  end

  private

  def move(vector)
    direction, distance = vector.split(' ')
    case direction
    when 'forward'
      @position += distance.to_i
    when 'up'
      @depth -= distance.to_i
    when 'down'
      @depth += distance.to_i
    end
  end
end

input = File.readlines('2021/inputs/day02.txt')
puzzle = Day02.new(input)
puts puzzle.part1
