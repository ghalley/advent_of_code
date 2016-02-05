weapons = [{name: 'Dagger', damage: 4, cost: 8},
           {name: 'Shortsword', damage: 5, cost: 10},
           {name: 'Warhammer', damage: 6, cost: 25},
           {name: 'Longsword', damage: 7, cost: 40},
           {name: 'Greataxe', damage: 8, cost: 74}
]

armor =   [{name: 'Leather', armor: 1, cost: 13},
           {name: 'Chainmail', armor: 2, cost: 31},
           {name: 'Splintmail', armor: 3, cost: 53},
           {name: 'Bandedmail', armor: 4, cost: 75},
           {name: 'Greataxe', armor: 5, cost: 102}
]

rings = [{cost: 0, damage: 0, armor: 0},
         {damage: 1, cost: 25, armor: 0},
         {damage: 2, cost: 50, armor: 0},
         {damage: 3, cost: 100, armor: 0},
         {armor: 1, cost: 20, damage: 0},
         {armor: 2, cost: 40, damage: 0},
         {armor: 3, cost: 80, damage: 0}
]

gold_spent = []

weapons.each do |weapon|
  armor.each do |armor|
    rings.combination(2).each do |ring1, ring2|
      boss_hp = 100
      boss_damage = 8
      boss_armor = 2
      damage = weapon[:damage] + ring1[:damage] + ring2[:damage]
      defense = armor[:armor] + ring1[:armor] + ring2[:armor]
      hit_points = 100

      while hit_points >0 && boss_hp > 0
        boss_hp -= (damage - boss_armor)
        break if boss_hp <= 0
        hit_points -= (boss_damage - defense)
      end

      gold_spent << (weapon[:cost] + armor[:cost] + ring1[:cost] + ring2[:cost]) if boss_hp <= 0
    end
  end
end

puts "#{gold_spent.min}"
