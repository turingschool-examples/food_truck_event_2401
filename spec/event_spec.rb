require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  let (:event) { Event.new('South Pearl Street Farmers Market') }
  let (:food_truck1) { FoodTruck.new('Rocky Mountain Pies') }
  let (:food_truck2) { FoodTruck.new('Ba-Nom-a-Nom') }
  let (:food_truck3) { FoodTruck.new('Palisade Peach Shack') }
  let (:item1) { Item.new({name: 'Peach Pie (Slice)', price: '$3.75'}) }
  let (:item2) { Item.new({name: 'Apple Pie (Slice)', price: '$2.50'}) }
  let (:item3) { Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'}) }
  let (:item4) { Item.new({name: 'Banana Nice Cream', price: '$4.25'}) }

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

      expect(event.food_truck_names).to eq(['Rocky Mountain Pies'])

      event.add_food_truck(food_truck2)
      
      expect(event.food_truck_names).to eq(['Rocky Mountain Pies', 'Ba-Nom-a-Nom'])
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

  describe '#list_all_items'
    it 'can return a list of all items that food trucks have in stock' do
      food_truck1.stock(item1, 35)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
  
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.list_all_items).to eq([item1, item4, item3])
    end

  describe '#sorted_item_list' do
    it 'can return a list of names of all items the food trucks have in stock sorted alphabetically' do
      food_truck1.stock(item1, 35)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
  
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      items = ['Banana Nice Cream', 'Peach Pie (Slice)', 'Peach-Raspberry Nice Cream']

      expect(event.sorted_item_list).to eq(items)

      food_truck1.stock(item2, 7)

      new_items = ['Apple Pie (Slice)', 'Banana Nice Cream', 'Peach Pie (Slice)', 'Peach-Raspberry Nice Cream']

      expect(event.sorted_item_list).to eq(new_items)
    end
  end

  describe '#total_stock' do
    it 'can return the total stock of an item from all food trucks' do
      food_truck1.stock(item1, 35)
      event.add_food_truck(food_truck1)

      expect(event.total_stock(item1)).to eq(35)

      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck3)

      expect(event.total_stock(item1)).to eq(100)
    end
  end

  describe '#overstock_items' do
    it 'returns an array of all items that are overstocked: quanity over 50 and total trucks that sell it over 1' do
      food_truck1.stock(item1, 35)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
  
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.overstock_items).to eq([])

      food_truck3.stock(item1, 65)

      expect(event.overstock_items).to eq([item1])
    end
  end

  describe '#total_inventory' do
    it 'can return a hash of total inventory that reports the available inventory of all items sold at the event' do
      food_truck1.stock(item1, 35)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)

      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      inventory = {
        item1 => {
          quantity: 100,
          food_trucks: [food_truck1, food_truck3]
        },
        item3 => {
          quantity: 25,
          food_trucks: [food_truck2]
        },
        item4 => {
          quantity: 50,
          food_trucks: [food_truck2]
        }
      }

      expect(event.total_inventory).to eq(inventory)

      food_truck1.stock(item2, 7)

      new_inventory = {
        item1 => {
          quantity: 100,
          food_trucks: [food_truck1, food_truck3]
        },
        item2 => {
          quantity: 7,
          food_trucks: [food_truck1]
        },
        item3 => {
          quantity: 25,
          food_trucks: [food_truck2]
        },
        item4 => {
          quantity: 50,
          food_trucks: [food_truck2]
        }
      }

      expect(event.total_inventory).to eq(new_inventory)
    end
  end
end
