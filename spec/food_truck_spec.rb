require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  describe '#initialize' do
    it 'has attributes' do
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
    end
  end
end