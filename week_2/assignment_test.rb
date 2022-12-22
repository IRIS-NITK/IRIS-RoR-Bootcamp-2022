require_relative 'assignment'
require 'minitest/autorun'

class ArmstrongTest < Minitest::Test

  def test_armstrong_number
    test_cases = [
      {
        n: 000111,
        result: 1
      },
      {
        n: 11100,
        result: 2
      },
      {
        n: 0,
        result: 1
      },
      {
        n: 1100011100,
        result: 3
      },
    ]

    test_cases.each do |test_case|
      assert_equal test_case[:result], assignment(n: test_case[:n]),
        "answer_for(n: #{test_case[:n]}) is #{test_case[:result]}"
    end
  end
  
end