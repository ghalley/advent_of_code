building = File.read('inputs/day_01.txt')
puts building.count('(') - building.count(')')

floor = 0
building.split('').each_with_index do |f, i|
  f == '(' ? floor +=1 : floor -= 1
  if floor == -1
    puts i +1
    break
  end
end