# <p style="text-align:center"> ____INTRO TO RUBY____ </p>
## Literals
A <b>literal</b> is any notation that lets you represent a fixed value in source code. For instance, all of the following are literals in Ruby:
```
'Hello, world!'          // string literal
375                      // integer literal
3.141528                 // float literal
true                     // boolean literal
{ 'a' => 1, 'b' => 2 }   // hash literal
[ 1, 2, 3 ]              // array literal
:sym                     // symbol literal
nil                      // nil literal
```
<hr/>

## Printing  and Reading Inputs                      
We can use print or puts statements to print on the console. The difference between the two is that puts automatically appends a new line while print does not.

```
puts "Hello"       # puts inserts a new line
print "there"      # print does not insert a new line 
puts "!"
```
We can use gets to read inputs from the console
```
abc = gets
puts abc
```
<hr/>

## Comments in Ruby
Sometimes comments are necessary in our program to increase the readability of the code that we write. The interpreter treats every word u type in the code as code itself. Hence we need to follow certain syntax to add comments.
<br/><br/>
To add a single line comments we can just use # and the entire line following hash is ignored by the compiler 

```
# This is a single line comment
```
To add multi line comments. We can use =begin =end and insert all our comments between the two

```
=begin
 Multi Line Comments
=end
```
<hr/>

## Operators in Ruby
Operators are anything that performs an operation on operands.
### Basic Arithmetic
The Ruby programming language supports various arithmetic operators for all floating-point and integer numbers. These operators are + (addition), - (subtraction), * (multiplication), **(Exponent), / (division), and % (modulo)
```
puts  2 * 3 + 1/2   # Basic Arithmetic: +, -, /, *
puts  2**3          # Exponent
puts 2.pow(3)       # Same as above
puts  10 % 3        # Modulus Op. : returns remainder of 10/3
puts 10 / 3.0       # int's and doubles
```
### Relational Operators
Relational operators these check the relation between the two operands and return a true or false which is mostly used in conditional branching statements.
1. Less than(<) used to check if an operand is less than the other
2. Greater than(>) used to check if an operand is greater than the other
3. Less than or equal to(<=) used to check if an operand is less than or equal to the other
4. Greater than or equal to(>=) used to check if an operand is greater than or equal to the other
5. Comparison(==) is used to check if the two strings are equal
<hr/>

## Some important functions
1. .pow() function . This is similar to ** function . Its used to raise a number to a power of n 
2. .abs()  function. this function returns the absolute value of the number
3. Math.sqrt() . This function is present in the Math class. This function returns the square root of a number
4.  Math.log() . This function returns the log of a number to the base of e
5.  .to_i  This is used to convert any literal into integer literal 
6.  .to_f This is used to convert any literal into float literal 
7.  .to_s This is used to convert any literal into string literal 

```
puts 2.pow(3)     	   	 # 8
puts  2**3          	   	 # 8
puts Math.sqrt(144)        	 # 12.0
puts Math.log(10)          	 # divide by 2.303 for base 10     
puts -5.abs()			 # 5
puts  3.14.to_s + 4.to_s       # 3.144
puts  3.to_f                   # 3.0
puts "3.0".to_s                # 3.0
puts 100 + "50".to_i           # 150
puts  100 + "50.99".to_f       # 150.99
```
<hr/>

## Arrays
Arrays are ordered continuous collection of data. Each element of an array is associated with a unique linear integer number called as index which can be used to access the array elements 
Here are some most used array functions 
1. This is the standard syntax to access an array element: Arrayname[index]
2. We can remove the last element of an array using the .pop() function 
3. Delete the element at a particular index using the delete_at() function
4. Append an element to the array using the push() function
5. Insert an element at a particular index using the insert() function.
(Both push and insert is used to add element to array. The difference is we get to choose where to add the element in insert function)
6. We can sort the array using .sort() function
7. We can use the .include? Function to check if an element exist in the array 

```
arr = [4, 8, 16, 23, 42.0, "IRIS"]
#idx   0  1  2   3    4       5
#idx  -6 -5 -4  -3   -2      -1

arr[0] = 90
puts arr[0] # 90
puts arr[-1] # IRIS

# start at index 2 and give me 3 elements
puts arr[2,3] # 16, 23, 42.0

# give me elements from 2 to 5th index (inclusive)
puts arr[2..5] # 16, 23, 42.0, IRIS


## Array Methods

puts arr.length

# remove an element at the end
arr.pop()

# remove element at index 2
arr.delete_at(2)

# add an element at the end
arr.push(44)

# insert 1 at index 0 
# insert(index, element)
arr.insert(0,1)

# sort an array
puts arr.sort

# check if array includes 4
puts arr.include? 4

```
<hr/>

## Strings
1. .chomp - used to remove the blank line that is automatically generated by gets method
2. .strip - used to remove white spaces.
3. .length() - used to get the length of the string 
4. .include? - used to check if an element/substring exists in string
5. .chop() - used to remove last character of the string
6. String Interpolation ("#{var}" and "+var+") - used to replace the placeholders with their corresponding values

```
greeting = "Hello"
#indexes:   01234

puts greeting.length # 5
puts greeting[0] # H
puts greeting.include? "llo" # true
puts greeting.include? "z" # false
puts greeting[1,3] #e ll
puts greeting.chop()
# puts greeting.strip()

# String interpolation
name = "John"
puts "Your name is #{name}"
puts "Your name is " + name


# User Input

puts "Enter your name: "
name = gets                   # automatically creates a new line
puts "Hello #{name}, how are you"

puts "Enter first num: "
num1 = gets.chomp            
=begin
method that removes the blank line that is automatically created by “gets” after the input
=end
puts "enter second num: "
num2 = gets.chomp
puts num1 + num2
```
<hr/>

## Hashes
A Hash is a collection of key-value pairs like this: "employee" = > "salary". It is similar to an Array, except that indexing is done via arbitrary keys of any object type, not an integer index. We can access a value of an hash element by using the key associated with the element which is similar to how we access elements through index in arrays.
1. We can create a new hash using .new function
2. We can print all the values of an hash using .values function 
3. We can print all the keys of an hash using .keys function 
4. We can delete a particular element of an hash by passing the key to the delete() function
5. We can check if a key exists in an hash using .include?() 
6. We can merge two different arrays using .merge() function
```
# New Hash
h1 = {}
h2 = Hash.new

# New syntax
h1 = {city: "Bangalore", country: "India"}

# => is called the hash rocket - old syntax
h2 = {:name => "Keerthi", :branch => "ECE", :age => 2}

# mix and match
hash = {name: "Keerthi", :branch => "ECE", age: 19}

puts h1
puts h1.values
puts h1.keys
puts h1.include?(:city)
puts hash.merge(h1)

# Delete the key value pair referenced by name
# hash.delete(:name)

# hash[:name] = "Parth"
puts hash[:name]
puts hash[:branch]
```
<hr/>

## Naming Conventions
We need to follow certain standards while we name different Arrays/Variables/Hashes/Strings.
- Names are case-sensitive and may begin with letters, _
- After, may include letters, numbers, _
- Convention says Start with a lowercase word, then additional words are lowercase separated by an underscore ex. my_first_variable
- The name cannot be a ruby keyword ( BEGIN, END, alias, and, begin, break, case, class, def, module, next,	nil,	not,	or,	redo,	rescue,	retry,	return,
elsif,	end,	false,	ensure,	for,	if,	true,	undef,	unless, do,	else,	super,	then,	until,	when,	while,	defined?,	self)
<hr/>

## If Else Statements
The if/else statement executes a block of code if a specified condition is true. If the condition is false, another block of code can be executed
```
is_student = true
is_smart = true

if is_student and is_smart
  puts "You are a smart student"
elsif is_student and !is_smart
  puts "You are not a smart student"
else
  puts "You are not a student"
end                                 # Output= You are a smart student
```
We also have this unless statements which executes a block of code when the condition is false instead!
```
is_student = false

unless is_student
    puts "You are not a student"               
end                                   # Output= You are not a student
```
<hr/>

## Loop Statements
A program loop is a series of statements that executes for a specified number of repetitions or until specified conditions are met.
### for...in loop
for loops are used to loop over a collection of elements with a iterating variable.
```
my_nums = [4, 8, 15, 16, 23, 42]

for num in my_nums
  puts num
end

for index in 0..5
  puts index
end
```
### .each do loop
This loop creates an iterator object and loops it throughout the collection specified
```
my_nums = [4, 8, 15, 16, 23, 42]

my_nums.each do |num|
  puts num
end

5.times do |idx|          # 5.times returns 5 integer starting from 0
  puts idx
end
```
### While loop
Executes code while conditional is true. A while loop is used when the condition until when the loop should run is unkown. A while loop's conditional is separated from code by the reserved word do.
```
index = 1
while index <= 5
  puts index
  index += 1
end
```
<hr/>

## References
- [https://launchschool.com](https://launchschool.com/books/ruby/read/introduction#briefhistory)
- [https://www.codecademy.com](https://www.codecademy.com/learn/learn-ruby/modules/learn-ruby-introduction-to-ruby-u)
- [https://github.com/FabriDamazio](https://github.com/FabriDamazio/Ruby-Quick-Reference-Guide)
- [https://www.mikedane.com](https://www.mikedane.com/programming-languages/ruby/in-one-video/)
- [https://gist.github.com/mittal-parth](https://gist.github.com/mittal-parth/9feaf30f7919f2b2fef5a16d793ed520)


