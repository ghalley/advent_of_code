data = File.readlines("inputs/day_9.txt")


def parse_routes(data)
  route, distance = ''
  collection = {}
  data.each do |line|
    route, distance = line.split(' = ')
    route = route.split(' to ')
    collection[route] = distance.to_i
  end
  collection
end

puts "#{parse_routes(data)}"