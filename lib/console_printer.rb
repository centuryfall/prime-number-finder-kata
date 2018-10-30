class ConsolePrinter
  require '../lib/prime_number_generator'

  def initialize
    @messages = Hash.new()
    @messages[:newline] = {text: "\n"}
    @messages[:first_integer] = {text: "Please enter the first integer value:"}
    @messages[:second_integer] = {text: "Please enter the second integer value:"}
    @messages[:primes_returned] = {text: "The prime numbers returned are"}
  end

  #Returns the text of a message as a string
  def get_message(name_hash)
    @messages[name_hash][:text].to_s
  end

  #Prints a message and recieves an input from the user
  def ask_user_for_input(message)
    puts "#{message}"
    stored_value = gets.chomp
    stored_value
  end

  #Checks to make sure values entered are integers
  #Else, raises an error
  def determine_inputs(x, y)
    if Integer(x) && Integer(y)
      [x.to_i, y.to_i].sort!
    else
      raise ArgumentError => e
    end
  end

  #Runs the program with the prime_number_generator. The number generator will handle appropriate user inputs.
  # Inputs can be anything, but the generate_all_primes_from_range method will accept only integers.
  def execute_program(val_1, val_2)
    inputs = determine_inputs(val_1, val_2)
    @prime_number_generator = PrimeNumberGenerator.new
    puts get_message(:primes_returned)
    p @prime_number_generator.generate_all_primes_from_range(inputs[0], inputs[1])
    sleep 5
    exit(0)
  end
end