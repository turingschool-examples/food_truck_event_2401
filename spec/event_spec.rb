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

end