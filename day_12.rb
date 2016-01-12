require 'json'

file = File.read('inputs/day_12.txt')
json = JSON.parse(file)

# if array, traverse the array
# if hash, traverse with each_value
# if value is not hash or array, and is fixnum, add to sum

def traverse_json(item)
  if item.is_a? Array
    item.map {|i| traverse_json(i)}.reduce(:+)
  elsif item.is_a? Hash
    traverse_json(item.values)
  elsif item.is_a? Fixnum
    item
  else
    0
  end
end

current_sum = 0

json.each do |item|
  current_sum += traverse_json(item)
end

puts current_sum
