def prime(n)

    for i in (2..n/2)
        if n % i == 0
            return false
        end
    end
    return true

end

def prime_numbers(n:)
    arr = Array.new
    for i in (2..n)
        if prime(i)
            arr.push(i)
        end
    end
    return arr
end
