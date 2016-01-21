input = File.read('inputs/day_19.txt').split("\n")

def find_indices(target, string)
  index = 0
  indices = []
  while index = string.index(target,index)
    indices << index
    index += 1
  end
  indices
end

def swap_string(orignal_string, replacement_value, index)
  new_string = orignal_string.split('')
  new_string[index] = replacement_value
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
# original_molecule = 'HOH'

replacement_keys.each do |key|
  find_indices(key.keys.first, original_molecule).each do |index|
    string = original_molecule
    possibilities << swap_string(original_molecule, key.values.first, index)
  end
end

puts possibilities.uniq.count

# puts "#{swap_string('HOH', 'HO', 0)}"
# find_indices('H', 'HOH')
