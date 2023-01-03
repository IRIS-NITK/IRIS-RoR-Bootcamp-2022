def prime_numbers(n:)
  raise ArgumentError, "n must be greater than or equal to 2" if n < 2

  primes = []
  (2..n).each do |i|
    is_prime = true
    (2..Math.sqrt(i).ceil).each do |j|
      if i % j == 0
        is_prime = false
        break
      end
    end
    primes << i if is_prime
  end
 returns primes
end
