file = File.readlines('inputs/day_13.txt')
happy_hash = {}
file.each do |line|
  line = line.split(' ')
  if happy_hash[line.first].nil?
    happy_hash[line.first] = {line.last => {operation: line[2], amount: line[3]}}
  else
    happy_hash[line.first][line.last] = {operation: line[2], amount: line[3]}
  end
end
puts happy_hash
