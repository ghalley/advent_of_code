input = File.read('inputs/day_19.txt').split("\n")

replacement_keys = []

original_molecule = input.last

input[0..-3].each do |line|
  pieces = line.split(' => ')
  replacement_keys << {pieces.first => pieces.last}
end

puts replacement_keys
