class Pet
    ANIMAL_TYPE = {
      1 => 'Arthropod',
      2 => 'Fish',
      3 => 'Amphibia',
      4 => 'Reptiles',
      5 => 'Birds',
      6 => 'Mammals'
    }

    FOOD_COST_PER_KG = {
      1 => 100,
      2 => 600,
      3 => 1000,
      4 => 300,
      5 => 450,
      6 => 800
    }

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

    def habitat
      if HABITATS["Aquatic"].include? animal_type_id
        return "Aquatic"
      end
      if HABITATS["Terrariums"].include? animal_type_id
        return "Terrariums"
      end
      if HABITATS["Cages"].include? animal_type_id
        return "Cages"
      end
    end

    def food_cost_per_day
      return FOOD_COST_PER_KG[animal_type_id] * food_consumed_per_day
    end

    def food_required(days)
      return food_consumed_per_day * days
    end

    def food_cost(days)
      return food_cost_per_day * days
    end

    def self.cost_to_feed(pets, days)
      for animal in pets
        total += animal.food_consumed_per_day * FOOD_COST_PER_KG[animal]
      end
      return total * days.to_i
    end

    def self.group_by_animal_type(pets)
      ans = {}
      for animal in pets
        ans[animal.animal_type_id].push(name) #couldn't figure out how to make the values of the hash to be arrays
      end
      print pets
      return ans
    end
end
