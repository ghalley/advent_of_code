passwords = File.read('inputs/day02.txt').split("\n")
valid_passwords = 0
passwords.each do |entry|
  counts, letter, password = entry.split(' ')

  min, max = counts.split('-').map(&:to_i)
  letter.gsub!(':', '')

  valid_passwords += 1 if min <= password.count(letter) && password.count(letter) <= max
end

puts valid_passwords
