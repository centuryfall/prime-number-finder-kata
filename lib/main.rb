#Run this file

require '../lib/prime_number_generator.rb'
require '../lib/console_printer'

console = ConsolePrinter.new

int_1 = console.ask_user_for_input(console.get_message(:first_integer))
int_2 = console.ask_user_for_input(console.get_message(:second_integer))

console.execute_program(int_1,int_2)