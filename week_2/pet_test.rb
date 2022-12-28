require_relative 'pet'
require 'minitest/autorun'
require 'set'

class PetTest < Minitest::Test
  PETS = [
    {
      pet: Pet.new(name: 'cat',
        animal_type_id: 6,
        food_consumed_per_day: 0.4
      ),
      days: 10,
      food_required: 4.0,
      food_cost: 3200.0,
      habitat: 'Cages'
    },
    {
      pet: Pet.new(name: 'dog',
        animal_type_id: 6,
        food_consumed_per_day: 2
      ),
      days: 5,
      food_required: 10,
      food_cost: 8000,
      habitat: 'Cages'
    },
    {
      pet: Pet.new(name: 'clownfish',
        animal_type_id: 2,
        food_consumed_per_day: 0.01
      ),
      days: 100,
      food_required: 1,
      food_cost: 600,
      habitat: 'Aquatic'
    },
    {
      pet: Pet.new(name: 'python',
        animal_type_id: 4,
        food_consumed_per_day: 0.1
      ),
      days: 0,
      food_required: 0,
      food_cost: 0,
      habitat: 'Terrariums'
    }
  ]

  def test_animal_habitat
    PETS.each do |pet|
      assert_equal pet[:habitat], pet[:pet].habitat
    end
  end

  def test_food_required_for_n_days
    PETS.each do |pet|
      assert_equal pet[:food_required], pet[:pet].food_required(pet[:days])
    end
  end

  def test_food_cost_for_n_days
    PETS.each do |pet|
      assert_equal pet[:food_cost], pet[:pet].food_cost(pet[:days])
    end
  end

  def test_cost_to_feed_pets
    expected_cost = []

    # generate 100 random pets
    rand_pets = (1..100).map do
      pet = Pet.new(name: "Pet-#{(0...8).map { (65 + rand(25)).chr }.join}",
        animal_type_id: rand(1..6),
        food_consumed_per_day: 2
      )

      expected_cost << pet.food_cost_per_day

      pet
    end

    [4, 5, 7, 50, 0, 18, 400].each do |days|
      assert_equal Pet.cost_to_feed(rand_pets, days), 
        expected_cost.reduce(0) { |sum, c| sum + c * days },
        "Cost to feed animals do not match"
    end
  end

  def test_group_by_animal_type
    expected = {}

    # generate 100 random pets
    rand_pets = (1..100).map do
      pet = Pet.new(name: "Pet-#{(0...8).map { (65 + rand(25)).chr }.join}",
        animal_type_id: rand(1..6),
        food_consumed_per_day: 2
      )

      if expected[pet.animal_type_id]
        expected[pet.animal_type_id] << pet.name
      else
        expected[pet.animal_type_id] = [pet.name]
      end

      pet
    end

    answer = Pet.group_by_animal_type(rand_pets)

    assert_equal Set.new(expected.keys), Set.new(answer.keys),
      "No extra animal type ids should be present"
    
    expected.each do |k, pet_names|
      assert_equal Set.new(pet_names), Set.new(answer[k]),
        "Group of animal_type_id = #{k}, doesn't match"
    end
  end
end
