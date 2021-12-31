class Day03
  def initialize(input)
    @input = input
  end

  def part1
    bits = seperate_by_bit(@input)

    gamma_rate =[]
    epsilon_rate = []
    bits.each do |bit|
      ranked = rank_bits(bit)
      gamma_rate << ranked.first
      epsilon_rate << ranked.last
    end

    gamma_rate.join.to_i(2) * epsilon_rate.join.to_i(2)
  end

  def part2
    oxygen_rating = find_bits(@input, 0, 0).first
    c02_rating = find_bits(@input, 0, 1).first
    oxygen_rating.to_i(2) * c02_rating.to_i(2)
  end

  private

  def find_bits(input, index=0, rank_select)
    bits = seperate_by_bit(input)
    bit = bits[index]
    ranked = rank_bits(bit, part_2: true)
    selected = input.select {|input_bit| input_bit[index] == ranked[rank_select]}
    selected.length == 1 ? selected : find_bits(selected, index +1, rank_select)
  end

  def rank_bits(array, part_2: false)
    ranking = array.tally
    keys = ranking.keys
    if ranking[keys.first] > ranking[keys.last]
      [keys.first, keys.last]
    elsif part_2 && ranking[keys.first] == ranking[keys.last]
      %w(1 0)
    else
      [keys.last, keys.first]
    end
  end

  def seperate_by_bit(array)
    bits = []
    array.each do |line|
      line.split('').each_with_index do |bit, index|
        bits[index].nil? ? bits[index] = [bit] : bits[index] << bit
      end
    end
    bits
  end
end

input = File.readlines('2021/inputs/day03.txt')
puzzle = Day03.new(input)
puts "Day 3-1: #{puzzle.part1}"
puts "Day 3-2: #{puzzle.part2}"
