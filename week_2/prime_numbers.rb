
def prime_numbers(n:)
  prime_num =[]          #Array to store prime numbers
  if n>=2                 #Prime numbers can't be less than 2
     for i in 2..n        
       count=0
       j=i
           (2..(j-1)).each do |j|
               if i%j==0
                 count += 1
               end
               if count >0
                 break
               end
            end
       if count==0
         prime_num.push(i)                          #storing prime numbers in the array prime_num
       end
    end
   else
     raise ArgumentError.new("Incorrect Argument")         # error for n<2
   end
 return prime_num
end
