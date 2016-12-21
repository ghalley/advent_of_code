require 'pry'
class Day01
  EAST = {axis: 'y', L: '+', R: '-'}
  NORTH = {axis: 'x', L: '-', R: '+'}
  WEST = {axis: 'y', L: '-', R: '+'}
  SOUTH = {axis: 'x', L: '+', R: '-'}

  def self.run(instructions)
    directions = instructions.split(', ')
    @coordinates = [0,0]
    @facing = NORTH
    directions.each do |direction|
      move(direction)
      orientation(direction)
    end

    @coordinates.map {|xy| xy.abs}.reduce(:+)
  end

  def self.orientation(direction)
    @facing = case @facing
              when NORTH
                direction[0] == 'R' ? EAST : WEST
              when EAST
                direction[0] == 'R' ? SOUTH : NORTH
              when SOUTH
                direction[0] == 'R' ? WEST : EAST
              when WEST
                direction[0] == 'R' ? NORTH : SOUTH
              end
  end

  def self.move(direction)
    if @facing[:axis] == 'x'
      @coordinates[0] = @coordinates.first.send(@facing[direction[0].to_sym].to_sym, direction[1..-1].to_i)
    else
      @coordinates[1] = @coordinates.last.send(@facing[direction[0].to_sym].to_sym, direction[1..-1].to_i)
    end
  end
end
