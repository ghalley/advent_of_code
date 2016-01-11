def find_straights(string)
  string.split('').each_with_index do |char, index|
    second = char.next
    third = second.next
    return true if string[index+1] == second && string[index+2] == third
  end
  false
end

def excludes_letters(string)
  !(string.include?('i') ||
    string.include?('o') ||
    string.include?('l'))
end

def double_letters?(string)
  index_found = nil
  string.chars.each_with_index do |char, index|
    next if index == 0
    if char == string[index - 1]
      index_found = index+1
      break
    end
  end

  return false if index_found.nil?

  string.chars[index_found..-1].each_with_index do |char, index|
    next if index == 0
    return true if char == string.chars[index_found..-1][index - 1] && char != string[index_found-1]
  end
  false
end


def next_password(string)
  passing = false

  while !passing
    string.next!
    passing = find_straights(string) && excludes_letters(string) && double_letters?(string)
  end
  string
end

puts next_password('abcdefgh')
puts next_password('ghijklmn')

puts next_password('hxbxwxba')