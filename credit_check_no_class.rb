valid = false
card_number = "4929735477250543"
reformatted_card_number = card_number.reverse.split("").map do |char|
      char.to_i
    end
card_number = []
    reformatted_card_number.each_with_index do |num, index|
      num *= 2 if index.odd?
      card_number << num
    end
card_number.map! do |value|
      if value > 9
        value -= 9
      else
        value
      end
    end
sum = card_number.reduce(0) do |sum, num|
      sum + num
    end

valid = true if sum % 10 == 0

if valid
  puts "The number is valid!"
else
  puts "The number is invalid!"
end

  