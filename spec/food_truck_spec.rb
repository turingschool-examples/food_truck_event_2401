require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe FoodTruck do
  let (:food_truck) { FoodTruck.new("Rocky Mountain Pies") }

  describe '#initialize' do
    it 'exists' do
      expect(food_truck).to be_a(FoodTruck)
    end

    it 'has a name' do
      expect(food_truck.name).to eq('Rocky Mountain Pies')
    end

    it 'has no inventory by default' do
      expect(food_truck.inventory).to eq({})
    end
  end
end