require "minitest/autorun"
require "minitest/spec"
require 'pry'

require_relative 'day_01'

Dir.chdir(File.dirname(__FILE__))

describe "Day 01" do
  describe 'Part 1' do
    it 'should caculate the first example' do
      instructions = 'R2, L3'

      assert_equal 5, Day01.run(instructions)
    end

    it 'should calculate the second example' do
      instructions = 'R2, R2, R2'

      assert_equal 2, Day01.run(instructions)
    end

    it 'a full circle as 0' do
      instructions = 'R2, R2, R2, R2'

      assert_equal 0, Day01.run(instructions)
    end

    it 'should calculate the third example' do
      instructions = 'R5, L5, R5, R3'

      assert_equal 12, Day01.run(instructions)
    end

    it 'calculates the output' do
      instructions = File.read('day01-1.txt')

      assert_equal 239, Day01.run(instructions)
    end
  end

  describe 'Part 2' do
    it 'finds the first repeated location' do
      instructions = 'R8, R4, R4, R8'

      assert_equal 4, Day01.run2(instructions)
    end

    it 'calculates the coordinates in a path' do
      coordinates1 = [0,0]
      coordinates2 = [0,3]
      assert_instance_of Array, Day01.find_line(coordinates1, coordinates2)
      assert_equal [[0,0], [0,1], [0,2]], Day01.find_line(coordinates1, coordinates2)
    end

    it 'calculates the output' do
      instructions = File.read('day01-1.txt')

      assert_equal 141, Day01.run2(instructions)
    end
  end
end
