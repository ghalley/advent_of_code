depth_readings = File.read('2021/inputs/day01pt1.txt').split("\n").map(&:to_i)

increases = 0

depth_readings.each_with_index do |reading, index|
  next if index == 0

  increases += 1 if reading > depth_readings[index -1]
end

puts increases