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

    it "Food Truck can check stock for specific item" do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

        expect(food_truck.check_stock(item1)).to eq 0
    end

    it "Food Truck can stock a specific item and quantity" do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

        expect(food_truck.check_stock(item1)).to eq 0

        food_truck.stock(item1, 30)
        
        expect(food_truck.check_stock(item1)).to eq 30
    end

end