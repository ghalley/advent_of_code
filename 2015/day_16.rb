file = File.readlines('inputs/day_16.txt')

clues = {'children' => '3',
          'cats' => '7',
          'samoyeds' => '2',
          'pomeranians' => '3',
          'akitas' => '0',
          'vizslas' => '0',
          'goldfish' => '5',
          'trees' => '3',
          'cars' => '2',
          'perfumes' => '1'}
sues = []
file.each do |line|

  array = line.split(' ')
  sues << {id: array[1].gsub(':', ''), array[2].gsub(':', '') => array[3].gsub(',', ''), array[4].gsub(':', '') => array[5].gsub(',', ''), array[6].gsub(':', '') => array[7].gsub(',', '')}
end

def compare_sue(sue, present)
  new_sue = sue.dup

  new_sue.delete(:id)
  present.merge(new_sue) == present
end

def new_compare_sue(sue, present)
  new_sue = sue.dup

  return false if new_sue['cats'] && new_sue['cats'] < present['cats']
  return false if new_sue['trees'] && new_sue['trees'] < present['trees']
  return false if new_sue['pomeranians'] && new_sue['pomeranians'] > present['pomeranians']
  return false if new_sue['goldfish'] && new_sue['goldfish'] > present['goldfish']

  new_sue.delete(:id)
  new_sue.delete('cats')
  new_sue.delete('trees')
  new_sue.delete('pomeranians')
  new_sue.delete('goldfish')

  present.merge(new_sue) == present
end

second_sues = sues.map {|s| s if new_compare_sue(s, clues)}

sues.keep_if {|s| compare_sue(s, clues)}

puts "#{sues.first[:id]}"
puts "#{second_sues.compact.first[:id]}"
