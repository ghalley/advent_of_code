passports = File.read('inputs/day04.txt').split("\n\n")

valid_passports = 0

def fields_present(passport)
  necessary_keys = %w[byr iyr eyr hgt hcl ecl pid]
  passport_items = {}
  passport.gsub("\n", ' ').split(' ').each do |item|
    passport_items[item.split(':').first] = item.split(':').last
  end

  missing_keys = (necessary_keys - passport_items.keys)
  missing_keys.empty?
end
passports.each do |passport|
  valid_passports += 1 if fields_present(passport)
end

puts valid_passports

def valid_byr(passport)
  return false if passport['byr'].nil?

  year = passport['byr'].to_i

  passport['byr'].length == 4 && year < 2003 && year > 1919
end

def valid_iyr(passport)
  return false if passport['iyr'].nil?

  year = passport['iyr'].to_i

  passport['iyr'].length == 4 && year <= 2020 && year >= 2010
end

def valid_eyr(passport)
  return false if passport['eyr'].nil?

  year = passport['eyr'].to_i

  passport['eyr'].length == 4 && year <= 2030 && year >= 2020
end

def valid_hgt(passport)
  return false if passport['hgt'].nil?

  unit = passport['hgt'].chars.last(2).join
  return false unless %w[in cm].include?(unit)

  value = passport['hgt'].gsub(unit, '').to_i

  if unit == 'cm'
    value >= 150 && value <= 193
  elsif unit == 'in'
    value >= 59 && value <= 76
  end
end

def valid_hcl(passport)
  return false if passport['hcl'].nil? || passport['hcl'][0] != '#'

  value = passport['hcl'].split('#').last
  value.length == 6 && !(/\W/.match?(value))
end

def valid_ecl(passport)
  return false if passport['ecl'].nil?

  %w[amb blu brn gry grn hzl oth].include?(passport['ecl'])
end

def valid_pid(passport)
  return false if passport['pid'].nil?

  !/[a-zA-Z]/.match?(passport['pid']) && passport['pid'].length == 9
end

def valid_cid(passport)
  true
end

valid_passports = 0

passports.each do |passport|
  passport_items = {}
  passport.gsub("\n", ' ').split(' ').each do |item|
    passport_items[item.split(':').first] = item.split(':').last
  end

  validity = passport_items.keys.map do |item|
    send("valid_#{item}", passport_items)
  end

  valid_passports += 1 if validity.all? && fields_present(passport)
end

puts valid_passports
