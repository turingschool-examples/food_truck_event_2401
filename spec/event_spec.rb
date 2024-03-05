require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
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
      expect(event).to be_a(Event)
    end

    it 'has a name' do
      expect(event.name).to eq('South Pearl Street Farmers Market')
    end

    it 'has no food trucks by default' do
      expect(event.food_trucks).to eq([])
    end
  end

  describe '#add_food_truck' do
    it 'can add food trucks to its list of food trucks' do
      event.add_food_truck(food_truck1)

      expect(event.food_trucks).to eq([food_truck1])

      event.add_food_truck(food_truck2)
      
      expect(event.food_trucks).to eq([food_truck1, food_truck2])
    end
  end

  describe '#food_truck_names' do
    it 'can list the names of all the food trucks' do
      event.add_food_truck(food_truck1)

      expect(event.food_truck_names).to eq(["Rocky Mountain Pies"])

      event.add_food_truck(food_truck2)
      
      expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom"])
    end
  end

  describe '#food_trucks_that_sell' do
    it 'can list the food trucks that sell an item' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
  
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      item1_trucks = event.food_trucks_that_sell(item1)

      expect(item1_trucks).to eq([food_truck1, food_truck3])

      item4_trucks = event.food_trucks_that_sell(item4)

      expect(item4_trucks).to eq([food_truck2])
    end

    it 'will not list food trucks that no longer have that item in stock' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
  
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      item1_trucks = event.food_trucks_that_sell(item1)

      expect(item1_trucks).to eq([food_truck1, food_truck3])

      food_truck3.stock(item1, 0)

      new_item1_trucks = event.food_trucks_that_sell(item1)

      expect(new_item1_trucks).to eq([food_truck1])
    end
  end
end
