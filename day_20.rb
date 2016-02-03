require "prime"

def find_divisors(original_number)
  divisors = []
  1.upto((original_number.to_f**0.5).floor).each do |current_num|
    q,r = original_number.divmod current_num
    divisors << q << r if r.zero?
  end
  divisors.uniq.sort
end

def find_house(minimum)
  index = 310000
  found = false
  while !found
    index +=1
    next if Prime.prime?(index)
    divisors = find_divisors(index)

    sum = divisors.map! { |d| d * 10 }.reduce(:+)
    found = sum >= minimum
  end
  index
end

puts find_house(36000000)
