require 'pry'

class Day02
  GRID = [[1,2,3],
          [4,5,6],
          [7,8,9]]

  attr_accessor :instructions, :location

  def initialize(instructions)
    @instructions = instructions.split("\n")
    @location = [1,1]
  end

  def move(instruction)
    case instruction
    when 'U'
      @location = [@location.first, @location.last - 1] unless @location.last == 0
    when 'D'
      @location = [@location.first, @location.last + 1] unless @location.last == 0
    end
  end

end
