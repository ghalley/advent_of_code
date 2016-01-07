data = File.readlines("day_8.txt")
code_length = 0
mem_length = 0
data.each do |line|
  l = line.chomp
  code_length += l.length
  mem_length += eval(l).length
end

puts code_length - mem_length