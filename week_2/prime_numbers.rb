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
  if n<2
    raise ArgumentError, "Given number is not valid for this operation"
  end
  prime = Array.new(n+1,false)
  prime.each_with_index do |num,i|
      if i>1
          if num==false
              j = i*i
              while j<=n
                  prime[j] = true
                  j += i
              end
          end
      end
  end
  nums=Array.new

  prime.each_with_index do |num,i|
      if i>1 && !num
          nums << i
      end
  end

  return nums
end
