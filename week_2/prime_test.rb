require_relative 'prime_numbers'
require 'minitest/autorun'

class PrimeTest < Minitest::Test
  PRIMES = [
    2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43,
    47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103,
    107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163,
    167, 173, 179, 181, 191, 193, 197, 199
  ]

  def test_prime_numbers
    expected = []

    PRIMES.each do |prime|
      expected << prime

      assert_equal expected, prime_numbers(n: prime),
        "Wrong asnwer for n: #{prime}"
    end
  end

  def test_raises_argument_error
    assert_raises(ArgumentError) do
      prime_numbers(n: -55)
    end

    assert_raises(ArgumentError) do
      prime_numbers(n: -3)
    end
  end
end
