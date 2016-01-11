def count_digits(string)
  new_array = []
  current_count = 1

  string.split('').each_with_index do |char, index|
    next if index == 0
    if char == string[index-1]
      current_count+=1
    else
      new_array << [current_count.to_s, string[index-1]]
      current_count = 1
    end

    if index == (string.length - 1) && char == string[index-1]
      new_array << [current_count.to_s, char]
    elsif index == (string.length - 1)
      new_array << [1, char]
    end

  end

  puts "#{new_array.flatten.join.length}"
end

count_digits('1113222113')
