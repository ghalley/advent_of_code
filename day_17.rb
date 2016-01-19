container_input = [33, 14, 18, 20, 45, 35, 16, 35, 1, 13, 18, 13, 50, 44, 48, 6, 24, 41, 30, 42]

def fill_containers(permutation)
  permutation
end

all_containers = []
container_input.size.times do |t|
  container_input.combination(t).each do |p|
    all_containers << p if p.reduce(:+) == 150
  end
end

puts "#{all_containers.length}"

min_length = all_containers.sort_by {|c| c.length}.first.length
puts "#{all_containers.keep_if {|c| c.length == min_length}.length}"
