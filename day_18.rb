file = File.readlines('inputs/day_18.txt')
sample = '.#.#.#
...##.
#....#
..#...
#.#..#
####..'

puts sample
# puts `clear`

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

  if light == '#' && [2,3].include?(neighbors_on)
    '#'
  elsif light == '#'
    '.'
  elsif light == '.' && neighbors_on == 3
    '#'
  else
    '.'
  end
end

def step_grid(grid)
  copy_grid = []

  grid.length.times do |row|
    new_row = []

    grid[row].length.times do |column|
      new_row << check_neighbors(grid[row][column], row, column, grid)
    end
    copy_grid << new_row
  end
  copy_grid
end

lights = []
sample.split("\n").each do |line|
  lights << line.split('')
end

grid = lights
100.times do
  grid = step_grid(grid)
end

puts
grid.each do |row|
  puts row.join('')
end
