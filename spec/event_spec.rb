require 'rspec'
require './lib/event.rb'
require './lib/food_truck.rb'
require './lib/item.rb'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Event do

    it "Event exists" do
        event = Event.new("South Pearl Street Farmers Market")
        expect(event).to be_a Event
    end

    it "Event has a name" do
        event = Event.new("South Pearl Street Farmers Market")
        expect(event.name).to eq "South Pearl Street Farmers Market"
    end

    it "Event has an no food trucks by default" do
        event = Event.new("South Pearl Street Farmers Market")
        expect(event.food_trucks).to eq []
    end

    it "Event can add food trucks" do
        event = Event.new("South Pearl Street Farmers Market")
        food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

        event.add_food_truck(food_truck1)    
        event.add_food_truck(food_truck2)

        expect(event.food_trucks).to eq [food_truck1, food_truck2]
    end

    it "Event can display food truck names" do
        event = Event.new("South Pearl Street Farmers Market")
        food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
        
        event.add_food_truck(food_truck1)    
        event.add_food_truck(food_truck2)

        expect(event.food_truck_names).to eq ["Rocky Mountain Pies", "Ba-Nom-a-Nom"]
    end

    it "Event can display food truck that sell a specific item" do
        event = Event.new("South Pearl Street Farmers Market")
        food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
        food_truck3 = FoodTruck.new("Grant's Food Truck")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

        food_truck1.stock(item1, 30)
        food_truck2.stock(item1, 50)
        food_truck3.stock(item2, 48)

        event.add_food_truck(food_truck1)    
        event.add_food_truck(food_truck2)
        event.add_food_truck(food_truck3)

        expect(event.food_trucks_that_sell(item1)).to eq [food_truck1, food_truck2]
    end

end