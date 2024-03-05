require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe FoodTruck do
  let (:food_truck) { FoodTruck.new("Rocky Mountain Pies") }
  let (:item1) { Item.new({name: 'Peach Pie (Slice)', price: "$3.75"}) }
  let (:item2) { Item.new({name: 'Apple Pie (Slice)', price: '$2.50'}) }

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

  describe '#check_stock' do
    it 'returns 0 if there is no stock of an item' do
      expect(food_truck.check_stock(item1)).to eq(0)
    end

    it 'can return the stocked amount of an item' do
      food_truck.stock(item1, 30)

      expect(food_truck.check_stock(item1)).to eq(30)
    end
  end

  describe '#stock' do
    it 'can stock an item' do
      food_truck.stock(item2, 15)

      expect(food_truck.check_stock(item2)).to eq(15)
    end
  end
end
