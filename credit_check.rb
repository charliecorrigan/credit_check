# CreditCheck class performs Luhn Algorithm
class CreditCheck
  
  # This function accepts a credit card number and calls the main program function
  def initialize(card_number) 
    @card_number = card_number
    is_valid?
  end

  # This is the main function of the program: Formats number, calculates validity, 
  # and prints the result 
  def is_valid?
    @card_number = format_card_number(@card_number)
    @card_number = double_odd_digits(@card_number)
    @card_number = sum_digits_over_10(@card_number)
    @card_number = sum_all_digits(@card_number)
    check_validity(@card_number) 
  end

  # This function splits card number into digits, converts from string to integers, 
  # and reverses the order of the digits
  def format_card_number(card_string)
    card_string.reverse.split("").map! do |char|
      char.to_i
    end
  end 

  # This function doubles the value of every other digit, beginning from the check digit
  def double_odd_digits(numbers_to_double)
    doubles = []
    numbers_to_double.each_with_index do |num, index|
      num *= 2 if index.odd?
      doubles << num
    end
    return doubles
  end

  # This function sums the individual digits of any numbers greater than 9 in the card 
  # number array
  def sum_digits_over_10(products_to_sum)
    products_to_sum.map do |value|
      if value > 9
        value -= 9
      else
        value
      end
    end
  end

  # This function sums together all digits in the card number array
  def sum_all_digits(digits_to_sum)
    digits_to_sum.reduce(0) do |sum, num|
      sum + num
    end
  end

  # This function checks for even division by ten and prints result
  def check_validity(processed_number)
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
