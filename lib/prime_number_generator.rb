class PrimeNumberGenerator

  def initialize
  end

  #Adds a number to an array of divisors if it is a divisor of 'value'
  def determine_if_divisor(divisors, value, comparison)
    divisors.push(comparison) unless value % comparison != 0
  end

  #Sets a flag either to itself or to false if it finds a comparison number makes the given value not prime
  def is_prime?(divisors)
    divisors.uniq.length <= 2 ? true : false
  end

  #Compares integers in a range to an array of pre-determined prime numbers
  def find_prime_numbers_in_range(lo, hi, prime_numbers)
    divisors = Array.new
    (lo..hi).each do |current_number|
      divisors.clear.push(current_number)
      prime_numbers = prime_numbers.uniq
      prime_numbers.each do |comparison|
        determine_if_divisor(divisors, current_number, comparison)
      end unless divisors.length > 2
      if is_prime?(divisors)
        prime_numbers.push(current_number)
      end unless current_number == 0
    end
    prime_numbers.sort
  end

  #Checks to make sure values entered are integers
  #Else, raises an error
  def determine_inputs(x, y)
    if Integer(x) && Integer(y)
      [x, y].sort!
    else
      raise StandardError => e
    end
  end

  ##This is the main method that determines how to return the prime numbers within the given [x,y] range
  def generate_all_primes_from_range(x, y)
    inputs = determine_inputs(x, y)
    all_prime_numbers = if inputs[0].negative? && inputs[1].negative?
                          find_prime_numbers_in_range(inputs[1].abs, inputs[0].abs,
                                                      find_prime_numbers_in_range(1, inputs[1].abs, [])
                          ).delete_if {|lo| lo < inputs[1].abs}.uniq
                        elsif inputs[0].negative? && inputs[1].positive?
                          find_prime_numbers_in_range(1, inputs[1],
                                                      find_prime_numbers_in_range(1, inputs[0].abs, [])
                          ).uniq
                        else
                          find_prime_numbers_in_range(inputs[0], inputs[1],
                                                      find_prime_numbers_in_range(1, inputs[0], []).uniq
                          ).delete_if {|lo| lo < inputs[0]}.uniq
                        end
    all_prime_numbers
  end
end