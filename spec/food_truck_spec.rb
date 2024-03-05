require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe FoodTruck do
  let (:event) { Event.new("South Pearl Street Farmers Market") }
  let (:food_truck1) { FoodTruck.new("Rocky Mountain Pies") }
  let (:food_truck2) { FoodTruck.new("Ba-Nom-a-Nom") }
  let (:food_truck3) { FoodTruck.new("Palisade Peach Shack") }
  let (:item1) { Item.new({name: 'Peach Pie (Slice)', price: "$3.75"}) }
  let (:item2) { Item.new({name: 'Apple Pie (Slice)', price: '$2.50'}) }
  let (:item3) { Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"}) }
  let (:item4) { Item.new({name: "Banana Nice Cream", price: "$4.25"}) }

  describe '#initialize' do
    it 'exists' do
      expect(food_truck1).to be_a(FoodTruck)
    end

    it 'has a name' do
      expect(food_truck1.name).to eq('Rocky Mountain Pies')
    end

    it 'has no inventory by default' do
      expect(food_truck1.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'returns 0 if there is no stock of an item' do
      expect(food_truck1.check_stock(item1)).to eq(0)
    end

    it 'can return the stocked amount of an item' do
      food_truck1.stock(item1, 30)

      expect(food_truck1.check_stock(item1)).to eq(30)
    end

    it 'can return its inventory of stocked items' do
      food_truck1.stock(item1, 30)

      expect(food_truck1.inventory).to eq({item1 => 30})

      food_truck1.stock(item2, 15)

      expect(food_truck1.inventory).to eq({item1 => 30, item2 => 15})
    end
  end

  describe '#stock' do
    it 'can stock an item' do
      food_truck1.stock(item2, 15)

      expect(food_truck1.check_stock(item2)).to eq(15)
    end
  end

  describe '#potential_revenue' do
    it 'can return the sum of all its items price * quantity' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)

      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(food_truck1.potential_revenue).to eq(148.75)
      expect(food_truck2.potential_revenue).to eq(345.00)
    end
  end

  describe '#items_list' do
    it 'can return a list of all of its items names' do
      food_truck1.stock(item1, 35)

      expect(food_truck1.items_list).to eq(['Peach Pie (Slice)'])

      food_truck1.stock(item2, 7)

      expect(food_truck1.items_list).to eq(['Peach Pie (Slice)', 'Apple Pie (Slice)'])
    end
  end
end
