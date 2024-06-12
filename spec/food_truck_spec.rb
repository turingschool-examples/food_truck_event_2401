require './lib/item'
require './lib/food_truck'
require 'rspec'

RSpec.describe FoodTruck do 
  it 'exists and has attributes' do 
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck).to be_a(FoodTruck)
    expect(food_truck.name).to eq('Rocky Mountain Pies')
    expect(food_truck.inventory).to eq({})
  end

  it 'can check stock of an item' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach pie (Slice)', price: '$3.75'})
    expect(food_truck.check_stock(item1)).to eq(0)
  end
  
  it 'can stock items' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach pie (Slice)', price: '$3.75'})
    food_truck.stock(item1, 30)
    food_truck.stock(item1, 15)
    expect(food_truck.check_stock(item1)). to eq(45)
  end

  it 'can stock multiple items' do 
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({name: 'Peach pie (Slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pice (Slice)', price: '$2.50'})
    food_truck.stock(item1, 30)
    food_truck.stock(item2, 15)
    expect(food_truck.inventory). to eq({item1 => 30, item2 => 15})
  end
end