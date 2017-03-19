class CreditCheck
# CreditCheck class performs Luhn Algorithm  
  
  def initialize(card_number) 
    # This method accepts a credit card number and calls the main program function
    @card_number = card_number
    is_valid?
  end
 
  def is_valid?
    # This is the main method of the program: Formats number, calculates validity, 
    # and prints the result
    @card_number = format_card_number(@card_number)
    @card_number = double_odd_digits(@card_number)
    @card_number = sum_digits_over_10(@card_number)
    @card_number = sum_all_digits(@card_number)
    check_validity(@card_number) 
  end

  def format_card_number(card_string)
    # This method splits card number into digits, converts from string to integers, 
    # and reverses the order of the digits
    card_string.reverse.split("").map! do |char|
      char.to_i
    end
  end 

  def double_odd_digits(numbers_to_double)
    # This method doubles the value of every other digit, beginning from the check digit
    doubles = []
    numbers_to_double.each_with_index do |num, index|
      num *= 2 if index.odd?
      doubles << num
    end
    return doubles
  end

  def sum_digits_over_10(products_to_sum)
    # This method sums the individual digits of any numbers greater than 9 in the card 
    # number array
    products_to_sum.map do |value|
      if value > 9
        value -= 9
      else
        value
      end
    end
  end

  def sum_all_digits(digits_to_sum)
    # This method sums together all digits in the card number array
    digits_to_sum.reduce(0) do |sum, num|
      sum + num
    end
  end

  def check_validity(processed_number)
    # This method checks for even division by ten and prints result
    if processed_number % 10 == 0
      valid = true
      puts "The number is valid!"
    else
      valid = false
      puts "The number is invalid!"
    end
  end

end

# Use transaction number as variable, credit card number as argument
transaction_1 = CreditCheck.new("4929735477250543")
