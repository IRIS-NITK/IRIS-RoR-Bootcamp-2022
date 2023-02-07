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
  raise ArgumentError, "n must be positive int" if n <= 0
  primes = Array.new()

  for i in 2..n
    is_prime = true
    for j in 2..(i - 1)
      if i % j == 0
        is_prime = false
        break
      end
    end
    primes << i if is_prime
    i+=1
  end
return primes
end

