# Week 2 - Ruby
- [Intro to Ruby](./intro_to_ruby.md)

To make you familar with ruby syntax, we have created some exercises to help you
learn and practice Ruby syntax - covering conditional statements (`if`, `else`, `elsif`), 
different ways of iteration (`each`, `map`) and some object oriented code.

If you not familiar with programming concepts like `variable`, `function` and `class`,
you can refer to the following resources
- [TryRuby](https://try.ruby-lang.org/)
- [Learn Ruby the Hard Way](https://learnrubythehardway.org/book/).

## Pre-requisites
- [Ruby is installed](https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2022/tree/week2_assignment/setup).

> Follow this guide to [setup your workspace](https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2022/tree/week2_assignment/setup)

- Make sure you are in the correct directory(week_2) while running commands
```bash
cd week_2
ls #pet.rb   pet_test.rb ....
rvm gemset create week_2
rvm use 3.0.5@week_2
ruby <file_name>
```

## Submission
- Use the week2_<your_name> branch for your work
```bash
git checkout -b week2_<your_name>
```
- Your Pull Request will be graded by the automated tests.
- Once you have completed the assignment, submit a Pull
Request with your work to the branch `week2_assignment` **(not `main`)**.

## Prime number

This is a simple assignment to familiarize ourself with ruby.
In this assignment we will learn about loops in ruby and a bit of
error handling.

A [prime number](https://en.wikipedia.org/wiki/Prime_number) is a 
whole number greater than 1 that cannot be exactly divided by 
any whole number other than itself and 1 
(e.g. 2, 3, 5, 7, 11).

The function below takes a [keyword argument](https://en.wikipedia.org/wiki/Named_parameter) `n` and 
returns an array of prime numbers less than or equal to `n`.

For example, `prime_numbers(n: 20)` should return the following:
`[2, 3, 5, 7, 11, 13, 17, 19]`

If the user gives a invalid input like -4.
We will raise an `ArgumentError` exception to let the caller know that
their function arguments were incorrect.

**Note** - Do not use use the inbuilt `prime` library
> Implement the function `prime_numbers` in the file [`prime_numbers.rb`](prime_numbers.rb)
> and test your code with `ruby prime_test.rb`.

- [Ruby - if...else, case, unless - TutorialPoint](https://www.tutorialspoint.com/ruby/ruby_if_else.htm)
- [Ruby Keyword Arguments](https://thoughtbot.com/upcase/videos/ruby-keyword-arguments)
- [How to Use Ruby Conversion Methods](https://www.rubyguides.com/2018/09/ruby-conversion-methods/)
- [A Beginner's Guide to Exceptions in Ruby](https://www.honeybadger.io/blog/a-beginner-s-guide-to-exceptions-in-ruby/)

## Pet Store

You are working at a pet store and want to build a system
to let the pet owners know the maintenance cost of their pets.

The pet is represented using the `Pet` class. A `Pet` stores 
the following information:
- Name of the pet (`name`)
- Type of animal(Mammals, Fish ...)(`animal_type_id`)
- Food consumed by the pet per day in Kg(`food_consumed_per_day`)

> Implement the class `Pet` above in the file [`pet.rb`](pet.rb) and test
> your code with `ruby pet_test.rb`.

- [attr_accessor, attr_writer and attr_reader](https://www.rubyguides.com/2018/11/attr_accessor/)
- [map](https://apidock.com/ruby/Enumerable/map)
- [Ruby - Classes and Objects](https://www.tutorialspoint.com/ruby/ruby_classes.htm)
- [Class and Instance Methods in Ruby](http://www.railstips.org/blog/archives/2009/05/11/class-and-instance-methods-in-ruby/)
- [group_by (Enumerable)](https://apidock.com/ruby/Enumerable/group_by)
- [reduce (Enumerable)](https://apidock.com/ruby/Enumerable/reduce)


## Interactive Console

You can use the interactive ruby (`irb`) to help understand and debug
your code. `irb` is similar to python's interactive console and lets you
run any ruby code.

For example, to debug `prime_numbers.rb` do the following:
- Open a ruby console using `irb`.
- Include the ruby program using `require_relative 'prime_numbers'`.
- Execute the function (or any valid ruby statement using the
  interpreter).

![image](https://user-images.githubusercontent.com/66632353/209439834-f103fe31-4d5f-41d0-83e6-f2559163f7fb.png)

- [How to use IRB to Explore Ruby](https://www.digitalocean.com/community/tutorials/how-to-use-irb-to-explore-ruby)
