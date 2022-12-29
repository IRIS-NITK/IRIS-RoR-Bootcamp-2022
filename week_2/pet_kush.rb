class Pet
    Animal_type={
        1=>"MAMMAL",
        2=>"HUMAN",
        3=>"NITK PROFESSOR",
        4=>"NITK STUDENTS"
    }
    FOOD_COST_PER_KG={
        1=>100,
        2=>5000,
        3=>100000,
        4=>-10000
    }
    HABITATS={
        "GOOD"=>[1,4],
        "CLEVER"=>[2,4],
        "DEV(il)"=>[3]
    }
     attr_accessor :name, :animal_type_id, :food_consumed_per_day

  def initialize(name: , animal_type_id: , food_consumed_per_day:)
    @name = name
    @animal_type_id = animal_type_id
    @food_consumed_per_day = food_consumed_per_day
  end

 
  def habitat
    raise NotImplementedError # TODO
  end

 
  def food_cost_per_day
    return FOOD_COST_PER_KG[animal_type_id] * food_consumed_per_day
  end

  def food_required(days)
    raise NotImplementedError # TODO
  end

  
  def food_cost(days)
    raise NotImplementedError # TODO
  end

  
  def self.cost_to_feed(pets, days)
    raise NotImplementedError # TODO
  end

  def self.group_by_animal_type(pets)
    raise NotImplementedError # TODO
  end
end
