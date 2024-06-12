require './lib/event'
require './lib/food_truck'
require './lib/item'
require 'rspec'

RSpec.describe Event do
  before(:each) do
    @event = Event.new('South Pearl Street Farmers Market')
    @food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    @food_truck2 = FoodTruck.new('Cookies On Wheels')
    @food_truck3 = FoodTruck.new('Palisade Peach Shack')
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: 'Peach-Raspberry Ice Cream', price: '$5.30'})
    @item4 = Item.new({name: 'Oatmeal Chocolate Chip Cookie', price: '$3.25'})
  end

  it 'creates an event and name' do
    expect(@event.name).to eq('South Pearl Street Farmers Market')
    expect(@event.food_trucks).to eq([])
  end

  it 'can add food truck to event' do 
    @event.add_food_truck(@food_truck1)
    expect(@event.food_trucks).to eq([@food_truck1])
  end

  it 'returns array of all food truck names' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expected_names = ['Rocky Mountain Pies', 'Cookies On Wheels', 'Palisade Peach Shack']
    expect(@event.food_truck_names).to eq(expected_names)
  end

  it 'returns all food trucks selling a given item' do
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item2, 20)
    @food_truck3.stock(@item3, 65)

    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expected_names = ['Rocky Mountain Pies', 'Cookies On Wheels']
    expect(@event.food_trucks_that_sell(@item2)).to eq(expected_names)
    expected_names = ['Cookies On Wheels']
    expect(@event.food_trucks_that_sell(@item4)).to eq(expected_names)
  end

  it 'returns aray of all items sold at event alphabetically' do
    expect(@event.sorted_item_list).to eq(['Apple Pie (Slice)', 'Oatmeal Chocolate Chip Cookie', 'Peach Pie (Slice)', 'Peach-Raspberry Ice Cream'])
  end

  it 'returns overstocked items' do
    expect(@event.overstock_items).to eq([item2])
  end
  
  it 'returns hash with items as keys and quantity and food trucks as sub-hash values' do
    expected_inventory = {
        item1 => { quantity: 35, food_trucks: [food_truck1] },
        item2 => { quantity: 32, food_trucks: [food_truck1, food_truck2] },
        item3 => { quantity: 65, food_trucks: [food_truck3] },
        item4 => { quantity: 50, food_trucks: [food_truck2] }
      }
      expect(@event.total_inventory).to eq(expected_inventory)
  end
end