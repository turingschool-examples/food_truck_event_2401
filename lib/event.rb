class Event
  attr_reader :food_trucks

  def initialize
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

end