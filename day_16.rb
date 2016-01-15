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

sues.keep_if {|s| compare_sue(s, clues)}

puts "#{sues.first[:id]}"
