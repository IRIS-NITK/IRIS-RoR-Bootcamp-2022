# A prime number is a whole number greater than 1
# that cannot be exactly divided by any whole number 
# other than itself and 1 
# (e.g. 2, 3, 5, 7, 11).

# The function below takes a keyword arguments `n` and 
# returns an array of prime numbers less than or equal to
# `n`.

# For example, prime_numbers(n: 20) should return the following:
# [2, 3, 5, 7, 11, 13, 17, 19]

# If the user gives a invalid input like -4
# We will raise an `ArgumentError` exception to let the caller know that
# their function arguments were incorrect.
def prime_numbers(n:)
  # Validate the input
  raise ArgumentError, "n must be a positive integer" unless n.is_a?(Integer) && n > 0

  # Initialize an empty array to store the prime numbers
  primes = []

  # Iterate through the range of numbers from 2 to n
  (2..n).each do |i|
    # Initialize a flag variable to check if i is prime or not
    is_prime = true

    # Check if i is divisible by any number other than 1 and itself
    (2...i).each do |j|
      if i % j == 0
        # If i is divisible by j, then it is not a prime number
        is_prime = false
        break
      end
    end

    # If i is prime, add it to the list of prime numbers
    primes << i if is_prime
  end

  # Return the list of prime numbers
  primes
end
