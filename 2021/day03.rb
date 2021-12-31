class Day03
  def initialize(input)
    @input = input
  end

  def part1
    bits = []
    @input.each do |line|
      line.split('').each_with_index do |bit, index|
        bits[index].nil? ? bits[index] = [bit] : bits[index] << bit
      end
    end

    gamma_rate =[]
    epsilon_rate = []
    bits.map(&:tally).map do |bit|
      keys = bit.keys
      if bit[keys.first] > bit[keys.last]
        gamma_rate << keys.first
        epsilon_rate << keys.last
      else
        gamma_rate << keys.last
        epsilon_rate << keys.first
      end
    end

    gamma_rate.join.to_i(2) * epsilon_rate.join.to_i(2)
  end
end

input = File.readlines('2021/inputs/day03.txt')
puzzle = Day03.new(input)
puts puzzle.part1
