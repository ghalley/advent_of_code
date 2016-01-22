input = File.read('inputs/day_19.txt').split("\n")

def find_indices(target, string)
  indices = []
  found = string.index(target, 0)

  while found
    indices << found
    found = string.index(target, found+target.length)
  end

  indices
end

def swap_string(orignal_string, replacement_value, index, length)
  new_string = orignal_string.split('')
  new_string.slice!(index, length)
  new_string.insert(index, replacement_value)
  new_string.join('')
end

replacement_keys = []

original_molecule = input.last

input[0..-3].each do |line|
  pieces = line.split(' => ')
  replacement_keys << {pieces.first => pieces.last}
end


possibilities = []

# sample stuff
# replacement_keys = [{'H' => 'HO'}, {'H' => 'OH'}, {'O' => 'HH'}]
# original_molecule = 'HOHOHO'

replacement_keys.each do |key|
  find_indices(key.keys.first, original_molecule).each do |index|
    new_possibility = swap_string(original_molecule, key.values.first, index, key.keys.first.length)
    possibilities << new_possibility unless possibilities.include?(new_possibility)
  end
end

puts possibilities.length

# part 2
# https://www.reddit.com/r/adventofcode/comments/3xflz8/day_19_solutions/cy4etju
molecule = original_molecule

molecule.gsub!('Rn', '(')
molecule.gsub!('Ar', ')')
molecule.gsub!('Y', ',')
molecule.gsub!(/[a-z]/, '')

rn = molecule.count('(')
ar = molecule.count(')')
y = molecule.count(',')

symbols = molecule.length

puts symbols - (rn + ar) - (2 * y) - 1
