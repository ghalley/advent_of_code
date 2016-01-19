container_input = [33, 14, 18, 20, 45, 35, 16, 35, 1, 13, 18, 13, 50, 44, 48, 6, 24, 41, 30, 42]

# puts "#{}"

def fill_containers(permutation)
  permutation
end

all_containers = 0
container_input.size.times do |t|
  container_input.combination(t).each do |p|
    all_containers += 1 if p.reduce(:+) == 150
  end
end

puts "#{all_containers}"
