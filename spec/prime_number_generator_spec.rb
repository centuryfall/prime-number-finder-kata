require './lib/prime_number_generator.rb'

describe 'generator' do
  prime = PrimeNumberGenerator.new
  it 'accepts only integers' do
    expect {prime.determine_inputs(5, 10)}.to_not raise_error
    expect {prime.determine_inputs('a', 10)}.to raise_error(StandardError)
  end

  it 'accepts both positive and negative integers' do
    expect {prime.determine_inputs(-5, -10)}.to_not raise_error
    expect {prime.determine_inputs(10, 40)}.to_not raise_error
  end

  it 'accepts 0 as a value' do
    expect(prime.generate_all_primes_from_range(0, 5)).to eq([1, 2, 3, 5])
  end

  it 'adds a value to an array of divisors if the expected value modulo the comparison value has a remainder of 0' do
    divisors = []
    val = 20
    (1..val).each do |x|
      prime.determine_if_divisor(divisors, val, x)
    end
    expect(divisors).to eq ([1, 2, 4, 5, 10, 20])
  end

  it 'returns all prime numbers within the given range' do
    expect(prime.generate_all_primes_from_range(7900, 7920)).to eq([7901, 7907, 7919])
  end

  it 'allows a range greater than a low value of 1 to be used' do
    expect(prime.generate_all_primes_from_range(5, 19)).to eq([5, 7, 11, 13, 17, 19])
  end

  it 'returns an empty array if no numbers in the range are prime' do
    expect(prime.generate_all_primes_from_range(20, 22)).to eq([])
  end

  it 'returns allows ranges to be written low to high' do
    expect(prime.generate_all_primes_from_range(2, 11)).to eq([2, 3, 5, 7, 11])
  end

  it 'returns is inclusive of both endpoints if the values are both prime' do
    expect(prime.generate_all_primes_from_range(5, 17)).to eq([5, 7, 11, 13, 17])
  end

  it 'returns allows ranges to be written high to low' do
    expect(prime.generate_all_primes_from_range(10, 5)).to eq([5, 7])
  end

  it 'returns all prime numbers within the given range if one number is negative' do
    expect(prime.generate_all_primes_from_range(10, -5)).to eq([1, 2, 3, 5, 7])
  end

  it 'returns all prime numbers within the given range if both numbers are negative' do
    expect(prime.generate_all_primes_from_range(-10, -1)).to eq([1, 2, 3, 5, 7])
  end

  it 'does not return duplicate entries in the prime number array' do
    expect(prime.generate_all_primes_from_range(3, -3).length).to be < ([1, 1, 2, 2, 3, 3].length)
    expect(prime.generate_all_primes_from_range(3, -3)).to eq([1, 2, 3])
  end
end