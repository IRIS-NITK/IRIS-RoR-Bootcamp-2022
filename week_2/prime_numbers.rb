
def is_prime num

  if num <= 1 then
      return false
  end

  s = Math.sqrt(num)

  s = s.floor()

#   print "sqrt of #{num} is #{s}  "

  while s > 1
      if (num % s == 0) then
          return false
      else 
          s = s - 1
      end
  end
  return true
end

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

  if (n <= 1) then
    raise ArgumentError
  end
  i = 0
  result = []
  
  while (i <= n)
      if (is_prime i) then
          result.push(i)
      end
      i = i +1 
  end
  
  return result
end
