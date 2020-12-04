passwords = File.read('inputs/day02.txt').split("\n")
valid_passwords = 0
passwords.each do |entry|
  counts, letter, password = entry.split(' ')

  min, max = counts.split('-').map(&:to_i)
  letter.gsub!(':', '')

  valid_passwords += 1 if min <= password.count(letter) && password.count(letter) <= max
end

puts valid_passwords

valid_passwords = 0
passwords.each do |entry|
  indices, letter, password = entry.split(' ')
  letter.gsub!(':', '')

  indices = indices.split('-').map(&:to_i)
  next if password.index(letter).nil?

  first = password[indices.first - 1]
  second = password[indices.last - 1]

  next if first == letter && first == second

  if (password[indices.first - 1] == letter || !password[indices.last - 1] == letter) || (!password[indices.first - 1] == letter || password[indices.last - 1] == letter)
    valid_passwords += 1
  end
end

puts valid_passwords
