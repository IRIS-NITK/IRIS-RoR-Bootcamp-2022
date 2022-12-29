j=2;
i=0; c=0;
puts "Enter the value of n"
n=gets.chomp.to_i
puts  "n=#{n}";

puts"Prime no are "
if(n>2)
    puts 2;
end
for i in 3..n do
    c=0;
    for j in 2..i/2 do
        if (i%j==0)
           c=c+1; 
        end 
  end
        if(c==0)
            puts i
        
    end
end

