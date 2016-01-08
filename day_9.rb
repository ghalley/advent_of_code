# data = File.readlines("inputs/day_9_sample.txt")
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

def grab_route(key, routes)
  routes[key].nil? ? routes[key.reverse] : routes[key]
end

def calculate_distance(route, routes)
  distance = 0
  (route.length - 1).times do |index|
    first_leg = route[(index)..(index+1)]
    distance += grab_route(first_leg, routes)
  end

  distance
end

routes = parse_routes(data)

journeys = []

routes.keys.flatten.uniq.permutation.to_a.each do |route|
  distance = calculate_distance(route, routes)
  journeys << {route: route, distance: distance}
end

journeys.sort_by! {|r| r[:distance]}
puts journeys.first[:distance]
puts journeys.last[:distance]
