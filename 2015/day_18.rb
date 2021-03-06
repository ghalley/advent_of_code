file = File.readlines('inputs/day_18.txt')
sample = '##.#.#
...##.
#....#
..#...
#.#..#
####.#'

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

def step_grid(grid, corners)
  copy_grid = []

  grid.length.times do |row|
    new_row = []

    grid[row].length.times do |column|
      if corners &&
          ((row == 0 && column == 0) ||
          (row == 0 && column == (grid.first.length-1)) ||
          (row == (grid.length-1) && column == 0) ||
          (row == (grid.length-1) && column == (grid.first.length-1)))
        new_row << '#'
      else
        new_row << check_neighbors(grid[row][column], row, column, grid)
      end
    end
    copy_grid << new_row
  end
  copy_grid
end

def change_lights(grid, iterations, corners=false)
  if corners
    grid[0][0] = '#'
    grid[0][-1] = '#'
    grid[-1][0] = '#'
    grid[-1][-1] = '#'
  end
  iterations.times do
    grid = step_grid(grid, corners)
  end

  grid.flatten.count {|l| l == '#'}
end

sample_lights = []
sample.split("\n").each do |line|
  sample_lights << line.split('')
end

lights = []
file.each do |line|
  # leave out the \n at the end of each line
  lights << line.split('')[0..-2]
end

# puts change_lights(sample_lights, 5, true)
puts change_lights(lights, 100)
puts change_lights(lights, 100, true)
