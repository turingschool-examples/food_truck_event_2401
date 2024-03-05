require 'rspec'
require './lib/food_truck.rb'
require './lib/item.rb'


RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe FoodTruck do

    it "Food Truck exists" do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        expect(food_truck).to be_a FoodTruck
    end

    it "Food Truck has a name" do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        expect(food_truck.name).to eq "Rocky Mountain Pies"
    end

    it "Food Truck has an empty inventory by default" do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        expect(food_truck.inventory).to be_a Hash
    end

end