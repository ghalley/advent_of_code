require 'json'

file = File.read('inputs/day_12.txt')
json = JSON.parse(file)

# if array, traverse the array
# if hash, traverse with each_value
# if value is not hash or array, and is fixnum, add to sum

def traverse_json(item, ignored=nil)
  if item.is_a? Array
    item.map {|i| traverse_json(i, ignored)}.reduce(:+)
  elsif item.is_a? Hash
    item.values.include?(ignored) ? 0 : traverse_json(item.values, ignored)
  elsif item.is_a? Fixnum
    item
  else
    0
  end
end

current_sum = 0
ignored_sum = 0

json.each do |item|
  current_sum += traverse_json(item)
  ignored_sum += traverse_json(item, 'red')
end

puts current_sum
puts ignored_sum
