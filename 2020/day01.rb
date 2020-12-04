numbers = File.read('inputs/day01.txt').split("\n").map(&:to_i)
matching_entries = Array.new(2)

numbers.each do |number|
  next if matching_entries.entries.all?

  matching_entries[0] = number
  matches = numbers.select { |n| (matching_entries[0] + n) == 2020 }
  matching_entries[1] = matches.first unless matches.first.nil?
end
puts matching_entries.reduce(:*)

combos=numbers.permutation(3).to_a.select {|p| p.reduce(:+) == 2020}

puts combos.first.reduce(:*)
