class CreditCheck
  
  def initialize(card_number) 
    @card_number = card_number
    @valid = false
    is_valid?
  end
 
  def is_valid?
    @card_number = format_card_number(@card_number)
    @card_number = double_odd_digits(@card_number)
    @card_number = sum_digits_over_10(@card_number)
    @card_number = sum_all_digits(@card_number)
    check_validity(@card_number)
    output 
  end

  def format_card_number(card_string)
    card_string.reverse.split("").map! do |char|
      char.to_i
    end
  end 

  def double_odd_digits(numbers_to_double)
    doubles = []
    numbers_to_double.each_with_index do |num, index|
      num *= 2 if index.odd?
      doubles << num
    end
    return doubles
  end

  def sum_digits_over_10(products_to_sum)
    products_to_sum.map do |value|
      if value > 9
        value -= 9
      else
        value
      end
    end
  end

  def sum_all_digits(digits_to_sum)
    digits_to_sum.reduce(0) do |sum, num|
      sum + num
    end
  end

  def check_validity(processed_number)
    @valid = true if processed_number % 10 == 0
  end

  def output
    if @valid == true
      puts "The number is valid!"
    else
      puts "The number is invalid!"
    end
  end
end

transaction_1 = CreditCheck.new("4929735477250543")
