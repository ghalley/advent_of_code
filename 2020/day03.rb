path = File.read('inputs/day03.txt').split("\n")

current_index = 0
current_row = 1
trees = 0

# puts path[3][30]
while current_row < path.length
  current_index += 3

  trees += 1 if path[current_row][current_index%31] == '#'

  current_row += 1
end
puts trees
