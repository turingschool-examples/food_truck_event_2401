class Event 
  attr_reader :name, :food_trucks, :food_truck_names

  def initialize(name)
    @name = name
    @food_trucks = []
    @food_truck_names = []
  end
  
  def add_food_truck(food_truck)
    @food_trucks << food_truck
    @food_truck_names << food_truck.name
  end

  def food_trucks_that_sell(item)
    @food_trucks.map {|food_truck, inventory| food_truck if inventory = item}
    # shared_inventory_array.map {|food_truck, inventory| k if v = item}
    
  end


end

# @inventory[item] += number