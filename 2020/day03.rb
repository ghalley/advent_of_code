def count_trees(horizontal, vertical)
  path = File.read('inputs/day03.txt').split("\n")
  slope = [horizontal,vertical]

  current_index = 0
  current_row = slope.last
  trees = 0

  while current_row < path.length
    current_index += slope.first

    trees += 1 if path[current_row][current_index % 31] == '#'

    current_row += slope.last
  end
  trees
end

puts [count_trees(1, 1), count_trees(3, 1), count_trees(5, 1), count_trees(7, 1), count_trees(1, 2)].reduce(:*)
