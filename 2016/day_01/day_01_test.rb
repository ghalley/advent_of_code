require "minitest/autorun"
require "minitest/spec"
require_relative 'day_01'

describe "Day 01" do
  it 'should caculate the first example' do
    instructions = 'R2, L3'

    assert_equal 5, Day01.run(instructions)
  end
  it 'should calculate the second example' do
    instructions = 'R2, R2, R2'

    assert_equal 2, Day01.run(instructions)
  end
end
