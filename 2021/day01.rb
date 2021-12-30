depth_readings = File.read('2021/inputs/day01pt1.txt').split("\n").map(&:to_i)

def track_increases(array)
  increases = 0

  array.each_with_index do |reading, index|
    next if index == 0

    increases += 1 if reading > array[index -1]
  end

  increases
end

puts track_increases(depth_readings)

# Part 2

windows = []

depth_readings.each_with_index do |reading, index|
  windows_index = (index)%8
  next if depth_readings.length - index < 3

  sum = depth_readings[index, 3].reduce(:+)
  windows << sum
end

puts track_increases(windows)
