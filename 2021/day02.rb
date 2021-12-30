class Day02
  attr_accessor :position, :depth, :aim

  def initialize(input)
    @input = input
    @position = 0
    @depth = 0
    @aim = 0
  end

  def part1
    @input.each do |line|
      info = line.split(' ')
      case info.first
      when 'forward'
        move('position', :+, info.last.to_i)
      when 'up'
        move('depth', :-, info.last.to_i)
      when 'down'
        move('depth', :+, info.last.to_i)
      end
    end
    @position * @depth
  end

  def part2
    @input.each do |line|
      info = line.split(' ')
      case info.first
      when 'forward'
        move('position', :+, info.last.to_i)
        move('depth', :+, @aim * info.last.to_i)
      when 'up'
        move('aim', :-, info.last.to_i)
      when 'down'
        move('aim', :+, info.last.to_i)
      end
    end
    @position * @depth
  end

  private

  def move(direction, method, distance)
    send("#{direction}=", send("#{direction}").send(method, distance))
  end
end

input = File.readlines('2021/inputs/day02.txt')
puzzle = Day02.new(input)
puts puzzle.part1

puzzle = Day02.new(input)
puts puzzle.part2