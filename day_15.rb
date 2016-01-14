source_data = [{name: 'Sugar', capacity: 3, durability: 0, flavor: 0, texture: -3, calories: 2},
              {name: 'Sprinkles', capacity: -3, durability: 3, flavor: 0, texture: 0, calories: 9},
              {name: 'Candy', capacity: -1, durability: 0, flavor: 4, texture: 0, calories: 1},
              {name: 'Chocolate', capacity: 0, durability: 0, flavor: -2, texture: 2, calories: 8}]

sample = [{name: 'Butterscotch', capacity: -1, durability: -2, flavor: 6, texture: 3, calories: 8},
          {name: 'Cinnamon', capacity: 2, durability: 3, flavor: -2, texture: -1, calories: 3}]
class Ingredient
  attr_accessor :name, :capacity, :durability, :flavor, :texture, :calories

  def initialize(name, capacity, durability, flavor, texture, calories)
    @name = name
    @capacity = capacity
    @durability = durability
    @flavor = flavor
    @texture = texture
    @calories = calories
  end

  def calculate_score(score, amount)
    score < 0 ? 0 : (score * amount)
  end

  def capacity_score(amount)
    calculate_score(@capacity, amount)
  end

  def durability_score(amount)
    calculate_score(@durability, amount)
  end

  def flavor_score(amount)
    calculate_score(@flavor, amount)
  end

  def texture_score(amount)
    calculate_score(@texture, amount)
  end

  def calories_score(amount)
    calculate_score(@calories, amount)
  end

end

def calculate_score(score)
  score < 0 ? 0 : score
end

ingredients = source_data.map {|i| Ingredient.new(i[:name], i[:capacity], i[:durability], i[:flavor], i[:texture], i[:calories])}
# ingredients = sample.map {|i| Ingredient.new(i[:name], i[:capacity], i[:durability], i[:flavor], i[:texture], i[:calories])}

number_combinations = Array(1..100).combination(4).find_all {|a, b, c, d| a + b + c + d == 100}
# number_combinations = Array(1..100).combination(2).find_all {|a, b| a + b == 100}

combo_hash = {}

number_combinations.each do |arrangement|
  arrangement.permutation.to_a.each do |combo|
    capacity = 0
    durability = 0
    flavor = 0
    texture = 0

    combo.each_with_index do |amount, index|

      capacity += ingredients[index].capacity * amount
      durability += ingredients[index].durability * amount
      flavor += ingredients[index].flavor * amount
      texture += ingredients[index].texture * amount
    end

    capacity = calculate_score(capacity)
    durability = calculate_score(durability)
    flavor = calculate_score(flavor)
    texture = calculate_score(texture)

    combo_hash[combo] = capacity * durability * flavor * texture
  end
end

puts "#{combo_hash.sort_by { |a, b| b }.last}"
