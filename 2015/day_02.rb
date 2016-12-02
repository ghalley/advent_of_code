presents = File.readlines('inputs/day_02.txt')

def wrapping_paper(l, w, h)
  sides = [l*w, w*h, h*l]
  sides.sort!
  extra = sides.first

  total = 0

  sides.each do |side|
    total += side * 2
  end
  total + extra
end

def get_smaller_sides(sides)
  sides.first*2 + sides.last*2
end

total_sq_footage = 0
total_ribbon_footage = 0

presents.each do |present|
  dimensions = present.split('x').map {|d| d.to_i}
  total_sq_footage += wrapping_paper(dimensions[0].to_i, dimensions[1].to_i, dimensions[2]).to_i
  total_ribbon_footage += get_smaller_sides(dimensions.sort[0..1]) + dimensions.reduce(:*)
end

puts total_sq_footage
puts total_ribbon_footage

