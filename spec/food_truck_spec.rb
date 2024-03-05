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

end