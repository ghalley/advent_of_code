class Day05
  attr_accessor :map
  def initialize(input)
    @input = input.map {|row| row.split('->')}
    height = 0
    width = 0
    @coordinates = @input.map do |coordinate|
      coords = [
        coordinate.first.split(',').map(&:to_i),
        coordinate.last.split(',').map(&:to_i)
      ]

      width = coords.first.first if coords.first.first > width
      width = coords.last.first if coords.last.first > width
      height = coords.first.last if coords.first.last > height
      height = coords.last.last if coords.last.last > height
      coords
    end
    @map = []
    (height+1).times do
      @map << Array.new(width+1, 0)
    end
    puts "#{@map}"
  end

  def part1
    build_map
    puts "#{@map}"
  end

  def build_map
    @coordinates.each do |coordinate|
      if coordinate.first.first == coordinate.last.first
        puts "vertical move"
      else
        puts "horizontal move #{horizontal_line(coordinate)}"
      end
    end
  end

  def horizontal_line(coordinate)
    start, ending = coordinate
    puts coordinate.to_s
    if start.first < ending.first
      (ending.first - start.first).times do |i|
        puts "Add 1 to #{i}, #{start.last} #{@map[start.last]}"
        @map[start.last][i] = @map[start.last][i] + 1
      end
      puts "#{@map}"
      'right'
    else
      start.first.downto(ending.first).each do |i|
        # @map[start.last][]
        puts "Add 1 to #{i}, #{start.last} - #{@map[start.last]}"
        @map[start.last][i] = @map[start.last][i] + 1
      end
      'left'
    end
  end
end