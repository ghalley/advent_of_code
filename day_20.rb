def find_divisors(original_number)
  divisors = []
  (1..original_number).to_a.each do |current_num|
    if original_number % current_num == 0
      divisors << current_num
    end
  end
  divisors
end

find_divisors(9)
