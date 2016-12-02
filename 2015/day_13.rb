def calculate_happines(name1, name2, happy_hash)
  name1_total = happy_hash[name1][name2]
  name2_total = happy_hash[name2][name1]
  name1_total + name2_total
end

file = File.readlines('inputs/day_13.txt')
happy_hash = {}
file.each do |line|
  line.gsub!('.', '')
  line = line.split(' ')
  sign = line[2] == 'gain' ? 1 : -1
  if happy_hash[line.first].nil?
    happy_hash[line.first] = {line.last => (line[3].to_i * sign)}
  else
    happy_hash[line.first][line.last] = (line[3].to_i * sign)
  end
end

potential_arrangements = {}

happy_hash.keys.permutation.to_a.each do |order|
  total = 0
  order.each_with_index do |name, index|
    total = total + calculate_happines(name, order[index-1], happy_hash)
  end
  potential_arrangements[order] = total
end

puts "#{potential_arrangements.values.sort.last}"

happy_hash.keys.each do |key|
  if happy_hash['Gaby'].nil?
    happy_hash['Gaby'] = {key => 0}
  else
    happy_hash['Gaby'][key] = 0
  end
  happy_hash[key]['Gaby'] = 0
end

potential_arrangements = {}

happy_hash.keys.permutation.to_a.each do |order|
  total = 0
  order.each_with_index do |name, index|
    total = total + calculate_happines(name, order[index-1], happy_hash)
  end
  potential_arrangements[order] = total
end

puts "#{potential_arrangements.values.sort.last}"
