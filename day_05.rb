def nice_strings(strings)
  nice_ones = 0
  strings.each do |string|
    nice_ones += 1 if three_vowels?(string) && double_letters?(string) && bad_strings?(string)
  end
  nice_ones
end

def three_vowels?(string)
  vowels = 0
  "aeiou".each_char {|e| vowels += string.count(e)}
  vowels > 2
end

def double_letters?(string)
  string.chars.each_with_index do |char, index|
    next if index == 0
    return true if char == string[index - 1]
  end
  false
end

def bad_strings?(string)
  bad_strings = ['ab', 'cd', 'pq', 'xy']
  bad_strings.each do |bad_string|
    return false if string.include? bad_string
  end
  true
end

# Part 2

def nicer_strings(strings)
  nice_ones = 0

  strings.each do |string|
    nice_ones += 1 if double_doubles(string) && sandwich(string)
  end
  nice_ones
end

def double_doubles(string)
  string.split('').each_with_index do |char, index|
    next if index == 0
    sub = string[(index-1)..index]
    match = string.index(sub)

    if match
      return true if string.index(sub, match+2)
    end
  end
  false
end

def sandwich(string)
  string.split('').each_with_index do |char,index|
    return true if string[index+2] == char
  end
  return false
end

strings = File.readlines('inputs/day_05.txt')
puts nice_strings(strings)
puts nicer_strings(strings)