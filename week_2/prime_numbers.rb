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
  if n < 0
    raise ArgumentError.new("Negative Input is not allowed!")
  end
  
  ans = Array.new()
  index = 2
  index2 = 2
  flag = true
  while index <= n
    while index2 < index
      if index % index2 == 0
        flag = false
      end
      index2 += 1
    end
    
    if flag
      ans.push(index)# TODO
    end

    index += 1
    index2 = 2
    flag = true
  end
  return ans
end
