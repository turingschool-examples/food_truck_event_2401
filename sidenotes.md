Graded Items:

1. Create an Event with attributes: `Event.new`
1. Add a FoodTruck to an Event: `Event #add_food_truck`
1. Return the list of FoodTruck names for an Event: `Event #food_truck_names`
1. Return the list of FoodTrucks that sell a given Item for an Event: `Event #food_trucks_that_sell`
1. Return the potential revenue from a FoodTruck: `FoodTruck #potential_revenue`

A `FoodTruck` will be able to calculate their `potential_revenue` - the sum of all their items' price * quantity.

A `Event` is responsible for keeping track of `FoodTruck`s. It should have a method called `food_truck_names` that returns an array of all the `FoodTruck` names.

Additionally, the `Event` should have a method called `food_trucks_that_sell` that takes an argument of an item represented as a `String`. It will return a list of `FoodTruck`s that have that item in stock.

Use TDD to create a `Event` class that responds to the following interaction pattern:

```ruby

pry(main)> event.food_truck_names
#=> ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

pry(main)> event.food_trucks_that_sell(item1)
#=> [#<FoodTruck:ONE>, #<FoodTruck:THREE>]

pry(main)> event.food_trucks_that_sell(item4)
#=> [#<FoodTruck:TWO>]

pry(main)> food_truck1.potential_revenue
#=> 148.75

pry(main)> food_truck2.potential_revenue
#=> 345.00

pry(main)> food_truck3.potential_revenue
#=> 243.75  
