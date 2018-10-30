require './lib/console_printer.rb'

printer = ConsolePrinter.new
describe 'console printer' do

  it 'returns a message' do
    expect(printer.get_message(:first_integer)).to eq("Please enter the first integer value:")
  end

  it 'asks the user to enter an integer' do
    allow($stdin).to receive(:gets).and_return('5')
    a = $stdin.gets
    printer.ask_user_for_input(printer.get_message(:first_integer))
    expect(a).to eq (5.to_s)
  end

  it 'passes values only if they are an integer' do
    allow($stdin).to receive(:gets).and_return('5')
    a = $stdin.gets
    allow($stdin).to receive(:gets).and_return('10')
    b = $stdin.gets
    printer.ask_user_for_input(printer.get_message(:first_integer))
    printer.ask_user_for_input(printer.get_message(:second_integer))
    expect(printer.determine_inputs(a, b)).to eq ([5, 10])
  end

  it 'runs the program if both values entered are valid integers' do
    allow($stdin).to receive(:gets).and_return('7900')
    a = $stdin.gets
    allow($stdin).to receive(:gets).and_return('7920')
    b = $stdin.gets
    printer.ask_user_for_input(printer.get_message(:first_integer))
    printer.ask_user_for_input(printer.get_message(:second_integer))
    inputs = printer.determine_inputs(a,b)
    expect{printer.execute_program(inputs[0],inputs[1])}.to output('[7901, 7907, 7919]').to_stdout
  end

end