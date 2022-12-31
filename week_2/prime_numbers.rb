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

def sieve(num)
  is_prime = Array.new(num + 1, true)
  is_prime[0] = is_prime[1] = false
  i = 2
  while i * i <= num
    if is_prime[i]
      j = i * i
      while j <= num
        is_prime[j] = false
        j += i
      end
    end
    i += 1
  end
  return is_prime
end

def prime_numbers(n:200)
  if n <= 0
    raise ArgumentError.new("Positive value expected")
  end
  res = Array.new()
  p = sieve(n)
  i = 2
  while i <= n
    if p[i]
      res.append(i)
    end
    i += 1
  end
  return res
end

# puts "#{prime_numbers()}"