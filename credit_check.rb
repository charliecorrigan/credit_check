#TO DO: clean up method variables so sibling methods aren't sharing variables'

def format_number(card_number)
    value = card_number.split("").to_a.reverse
    new_number_array = []
    value.each do |c| 
        new_number_array.push(c.to_i)
    end
    return new_number_array
end

def doubler(account_id)
    account_id.each_index do |i|
        unless i.even? 
            account_id[i] *= 2
        end
    end
end

def sum_digits_over_10(account_id)
    new_account_id = []
    account_id.each do |value|
        if value > 9
            array = value.to_s.split("")
            value = array[0].to_i + array[1].to_i
        end
        new_account_id << value
    end
    return new_account_id

end

def sum_all_digits(digits)
    total = 0
    digits.each do |d|
        total += d
    end
    return total
end

card_number = "4929735477250543"
account_identifier = format_number(card_number)
puts "the account identifier is #{account_identifier}"
doubler(account_identifier)
puts "after doubler, the account identifier is #{account_identifier}"
account_identifier = sum_digits_over_10(account_identifier)
puts "after sum digits, account identifier is now #{account_identifier}"
summed_result = sum_all_digits(account_identifier)
puts "summed result is #{summed_result}"

if summed_result % 10 == 0 
    valid = true
end






# puts account_identifier[0].class
# puts account_identifier

# doubled_identifier = []
# counter = 0
# double_identifier = identifier.map do |num| 
#      if counter.even?
#          num
#      else
#          num *=2
#      end
#      counter +=
# end
# puts "the final array for tonight is #{double_identifier}"
# valid = false

# Your Luhn Algorithm Here

# Output
## If it is valid, print "The number is valid!"
## If it is invalid, print "The number is invalid!"