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
    flag = 1;
    i=2
    if n<=1
        raise ArgumentError
      end
    while i<=n
        flag = 1
        j = 2
        while j<i
            if(i%j==0)
                flag = 0;
                break
            end
            j+=1
        end
        if flag==1
            arr.push(i)
        end
        i+=1
    end
    return arr
end
