class Pet
  ANIMAL_TYPE = {
    1 => 'Arthropod',
    2 => 'Fish',
    3 => 'Amphibia',
    4 => 'Reptiles',
    5 => 'Birds',
    6 => 'Mammals'
  }

  # Each animal type requires a diffrent type of food
  # The food cost per 1 kg is is stored in the `FOOD_COST_PER_KG` Hash
  # where the `key` is the animal id and `value` is the cost
  #
  # Eg- The food of reptiles(animal_type id = 4) costs 300/kg.
  # (FOOD_COST_PER_KG[4] = 300)
  FOOD_COST_PER_KG = {
    1 => 100,
    2 => 600,
    3 => 1000,
    4 => 300,
    5 => 450,
    6 => 800
  }

  # Each animal requires its own habitat.
  #
  # The `HABITATS` hash stores the habitat required by each animal
  # The `key` is the habitat and the `value` is the array of
  # animal_type ids that live in that habitat.
  #
  # "habitat" => [animal_type_id]
  HABITATS = {
    "Aquatic" => [2, 1, 3],
    "Terrariums" => [4],
    "Cages" => [5, 6]
  }

  attr_accessor :name, :animal_type_id, :food_consumed_per_day

  def initialize(name: , animal_type_id: , food_consumed_per_day:)
    @name = name
    @animal_type_id = animal_type_id
    @food_consumed_per_day = food_consumed_per_day
  end

  # Return the habitat of the pet
  def habitat
    return HABITATS.keys.find{|key| HABITATS[key].include? animal_type_id}
  end

  # Returns the cost of food required to feed the animal 
  # per day
  def food_cost_per_day
    return FOOD_COST_PER_KG[animal_type_id] * food_consumed_per_day
  end

  # This function takes the number of `days` as the input
  # and returns the food required(in kgs) to feed the
  # pet for that many number of days
  #
  # Eg - if the pet requires 0.5 kg of food per day
  # (i.e, food_consumed_per_day = 0.5), then
  # pet.food_required(5) will return 2.5 as the answer
  #
  # cat = Pet.new(name: 'cat', animal_type_id: 6, food_consumed_per_day: 0.4)
  # cat.food_required(28) = 11.2 (0.4 * 28)
  def food_required(days)
    return food_consumed_per_day * days
  end

  # This function takes the number of `days` as the input
  # and returns the cost incurred to feed the pet for
  # that many number of days
  #
  # cat = Pet.new(name: 'cat', animal_type_id: 6, food_consumed_per_day: 0.4)
  # cat.food_cost(28) = 8960
  def food_cost(days)
    return food_required(days)*FOOD_COST_PER_KG[animal_type_id]
  end

  # This function takes an array of pets and the `days`
  # as input and returns the cost to feed them all 
  # for the specified number of `days`
  #
  # Eg -
  # cat = Pet.new(name: 'cat', animal_type_id: 6, food_consumed_per_day: 0.4)
  # dog = Pet.new(name: 'dog', animal_type_id: 6, food_consumed_per_day: 0.7)
  # fish = Pet.new(name: 'clownfish', animal_type_id: 2, food_consumed_per_day: 0.1)
  # snake = Pet.new(name: 'python', animal_type_id: 4, food_consumed_per_day: 0.3)
  # Pet.cost_to_feed([cat, dog, fish, snake], 6) will return 6180.0
  def self.cost_to_feed(pets, days)
    pets.reduce(0){|sum,pet| sum+pet.food_cost(days) }
  end

  # This function takes an array of pets as input
  # and returns a hash with pets name grouped by their animal type
  #
  # Eg - 
  # cat = Pet.new(name: 'cat', animal_type_id: 6, food_consumed_per_day: 0.4)
  # dog = Pet.new(name: 'dog', animal_type_id: 6, food_consumed_per_day: 0.7)
  # fish = Pet.new(name: 'clownfish', animal_type_id: 2, food_consumed_per_day: 0.1)
  # snake = Pet.new(name: 'python', animal_type_id: 4, food_consumed_per_day: 0.3)
  # Pet.group_by_animal_type([cat, dog, fish, snake]) will return the follwing hash
  # {
  #   6 => ['cat', 'dog'],
  #   2 => ['clownfish'],
  #   4 => ['python']
  # }
  #
  # Note - Order is not important
  def self.group_by_animal_type(pets)
    ans = {}
    pets.each do |pet|
      if ans[pet.animal_type_id] != nil
        ans[pet.animal_type_id].push(pet.name)
      else
        ans[pet.animal_type_id] = []
        ans[pet.animal_type_id].push(pet.name)
      end
    end
    return ans
  end
end
