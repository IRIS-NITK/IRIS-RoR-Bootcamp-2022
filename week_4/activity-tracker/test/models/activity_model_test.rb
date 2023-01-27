require "test_helper"

class ActivityTest < ActiveSupport::TestCase
    test 'has a string column title' do
      assert_equal :string, Activity.type_for_attribute('title').type
    end

    test 'has a string column type' do
      assert_equal :string, Activity.type_for_attribute('activity_type').type
    end

    test 'has a datetime column start' do
      assert_equal :datetime, Activity.type_for_attribute('start').type
    end

    test 'has a decimal column duration' do
      assert_equal :decimal, Activity.type_for_attribute('duration').type
    end

    test 'has an integer column calories' do
      assert_equal :integer, Activity.type_for_attribute('calories').type
    end
end