def prime_numbers(n:)
  if n>1
    primes=[]
    (2..n).each{ |n|
      prime=true
      (2..n/2).each{ |d|
        if n%d==0
          prime=false
          break
        end
      }
      primes << n if prime
    }
    return primes
 else
  raise ArgumentError
 end
end
