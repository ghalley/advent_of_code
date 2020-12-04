numbers = File.read('inputs/day01.txt').split("\n")
matching_entries = Array.new(2)

numbers.each do |number|
  next if matching_entries.entries.all?

  matching_entries[0] = number.to_i
  matches = numbers.select { |n| (matching_entries[0] + n.to_i) == 2020 }
  matching_entries[1] = matches.first.to_i unless matches.first.nil?
end
puts matching_entries.reduce(:*)