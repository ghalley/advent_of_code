data = File.readlines("inputs/day_8.txt")
code_length = 0
mem_length = 0
data.each do |line|
  l = line.chomp
  code_length += l.length
  mem_length += eval(l).length
end

puts code_length - mem_length

# Part 2

code_length = 0
mem_length = 0
data.each do |line|
  l = line.chomp
  code_length += l.length
  mem_length += l.dump.length
end

puts mem_length - code_length
