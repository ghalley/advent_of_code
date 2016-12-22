require "minitest/autorun"
require "minitest/spec"
require 'pry'

require_relative 'day_02'

Dir.chdir(File.dirname(__FILE__))

describe "Day 02" do
  describe 'Part 1' do
    it 'should have a matrix for the button grid' do
      assert_instance_of Array, Day02::GRID
    end

    it 'should split the instructions into lines' do
      instructions = "ULL\nRRDDD\nLURDL\nUUUUD"
      day = Day02.new(instructions)

      assert_equal instructions.lines.length, day.instructions.length
    end

    it 'starts on button 5' do
      instructions = "ULL\nRRDDD\nLURDL\nUUUUD"
      day = Day02.new(instructions)

      assert_equal [1,1], day.location
    end

    it 'changes the location based on character' do
      instructions = "ULL\nRRDDD\nLURDL\nUUUUD"
      day = Day02.new(instructions)

      day.move('U')
      assert_equal [1,0], day.location

      day.move('D')
      assert_equal [1,1], day.location
    end
  end
end
