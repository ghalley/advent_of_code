file = File.readlines('inputs/day_18.txt')
sample = '.#.#.#
...##.
#....#
..#...
#.#..#
####..'

puts sample
# puts `clear`

lights = []
sample.split("\n").each do |line|
  lights << line.split('')
end

def step_grid(grid)
  copy_grid = grid.dup

  grid.each do |row|
    row.each do |column|
      # check neighbors
    end
  end
end

def check_neighbors(light, row, column, grid)
  neighbors_on = 0
  neighbors_on += 1 if ((row - 1) >= 0 && (column - 1) >= 0) && grid[row - 1][column - 1] == '#'
  neighbors_on += 1 if ((row - 1) >= 0) && grid[row - 1][column] == '#'
  neighbors_on += 1 if ((row - 1) >= 0 && column < grid[row-1].length) && grid[row - 1][column + 1] == '#'
  neighbors_on += 1 if ((column - 1) >= 0) && grid[row][column - 1] == '#'
  neighbors_on += 1 if (column < grid[row].length) && grid[row][column + 1] == '#'
  neighbors_on += 1 if (row < (grid.length - 1)) && (column - 1) >= 0 && grid[row + 1][column - 1] == '#'
  neighbors_on += 1 if (row < (grid.length - 1)) && grid[row + 1][column] == '#'
  neighbors_on += 1 if (row < (grid.length - 1)) && column < grid[row+1].length && grid[row + 1][column + 1] == '#'

  neighbors_on
end

