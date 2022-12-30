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
    arr = []
    i=2
    if n<=1
        raise ArgumentError
      end
    while i<=n
        if check_prime(i)
            arr.push(i)
        end
        i+=1
    end
    return arr
end

def check_prime(i)
    flag = true
    j = 2
    while j<=(i/2)
        if(i%j==0)
            flag = false;
            break
        end
        j+=1
    end
    return flag
end
