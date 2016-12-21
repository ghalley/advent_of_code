require 'pry'
class Day01
  EAST = {axis: 'y', L: :+, R: :-}
  NORTH = {axis: 'x', L: :-, R: :+}
  WEST = {axis: 'y', L: :-, R: :+}
  SOUTH = {axis: 'x', L: :+, R: :-}

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

  def self.run2(instructions)
    directions = instructions.split(', ')
    @coordinates = [0,0]
    @facing = NORTH
    path = []
    directions.each do |direction|
      old = @coordinates.dup
      move(direction)
      orientation(direction)
      path << find_line(old, @coordinates)
    end

    path << [@coordinates]
    path.flatten!(1)
    path.keep_if { |c| path.index(c) != path.rindex(c)}.uniq.first.flatten.map {|xy| xy.abs}.reduce(:+)
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
      @coordinates[0] = @coordinates.first.send(@facing[direction[0].to_sym], direction[1..-1].to_i)
    else
      @coordinates[1] = @coordinates.last.send(@facing[direction[0].to_sym], direction[1..-1].to_i)
    end
  end

  def self.find_line(start, finish)
    line = [start]

    if start.first == finish.first
      distance = (start.last - finish.last)
      (distance.abs - 1).times do |t|
        new_coord = distance > 0 ? line.last.last - 1 : line.last.last + 1
        line << [start.first, new_coord]
      end
    else
      distance = (start.first - finish.first)
      (distance.abs - 1).times do |t|
        new_coord = distance > 0 ? line.last.first - 1 : line.last.first + 1
        line << [new_coord, start.last]
      end
    end
    line
  end
end
