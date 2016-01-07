data = File.readlines("inputs/day_9_sample.txt")


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

def grab_route(key, routes)
  routes[key].nil? ? routes[key.reverse] : routes[key]
end

routes = parse_routes(data)
puts "#{routes.keys.flatten.uniq.permutation.to_a}"
puts grab_route(['London', 'Dublin'], routes)
