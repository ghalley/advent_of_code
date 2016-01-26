def find_multipliers(original_number)
  multipliers = []
  (1..original_number).to_a.each do |current_num|
    if original_number % current_num == 0
      multipliers << current_num
    end
  end
  multipliers
end

find_multipliers(9)
