# Week 2 - Ruby

To make you familar with ruby syntax, we have created some exercises to help you
learn and practice Ruby syntax - covering conditional statements (`if`, `else`, `elsif`), 
different ways of iteration (`each`, `map`) and some object oriented code.

If you not familiar with programming concepts like `variable`, `function` and `class`,
you can refer to the following resources
- [TryRuby](https://try.ruby-lang.org/) and
- [Learn Ruby the Hard Way](https://learnrubythehardway.org/book/).

> Pre-requisites - [Ruby is installed](https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2022/tree/week2_assignment/setup).<br>
> Follow this guide to [setup your workspace](https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2022/tree/week2_assignment/setup)

## Prime number

This is a simple assignment to familiarize ourself with ruby.
In this assignment we will learn about loops in ruby and a bit of
error handling.

A [prime number](https://en.wikipedia.org/wiki/Prime_number) is a 
whole number greater than 1 that cannot be exactly divided by 
any whole number other than itself and 1 
(e.g. 2, 3, 5, 7, 11).

The function below takes a [keyword arguments]
(https://en.wikipedia.org/wiki/Named_parameter) `n` and 
returns an array of prime numbers less than or equal to `n`.

For example, `prime_numbers(n: 20)` should return the following:
`[2, 3, 5, 7, 11, 13, 17, 19]`

If the user gives a invalid input like -4
We will raise an `ArgumentError` exception to let the caller know that
their function arguments were incorrect.

**Note** - Do not use use the inbuilt `prime` library
> Implement the function `prime_numbers` in the file `prime.rb`
> and test your code with `ruby prime_test.rb`.

- [Ruby - if...else, case, unless - TutorialPoint](https://www.tutorialspoint.com/ruby/ruby_if_else.htm)
- [Ruby Keyword Arguments](https://thoughtbot.com/upcase/videos/ruby-keyword-arguments)
- [How to Use Ruby Conversion Methods](https://www.rubyguides.com/2018/09/ruby-conversion-methods/)
- [A Beginner's Guide to Exceptions in Ruby](https://www.honeybadger.io/blog/a-beginner-s-guide-to-exceptions-in-ruby/)
