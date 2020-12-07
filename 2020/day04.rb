passports = File.read('inputs/day04.txt').split("\n\n")

necessary_keys = %w[byr iyr eyr hgt hcl ecl pid]
valid_passports = 0
passports.each do |passport|
  passport_items = {}
  passport.gsub("\n", ' ').split(' ').each do |item|
    passport_items[item.split(':').first] = item.split(':').last
  end

  missing_keys = (necessary_keys - passport_items.keys)
  valid_passports += 1 if missing_keys.empty?
end

puts valid_passports
