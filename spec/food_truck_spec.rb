require 'pry'
require 'rspec'
require './lib/item'
require './lib/food_truck'

describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do
    expect(@food_truck).to be_a FoodTruck
  end

  it 'can return attributes' do
    expect(@food_truck.name).to eq "Rocky Mountain Pies"
  end

  it 'can add items to the inventory' do
    expect(@food_truck.inventory).to eq ({})

    @food_truck.stock(@item1, 30)

    expect(@food_truck.inventory).to eq ({@item1 => 30})
    
    @food_truck.stock(@item2, 25)
    
    expect(@food_truck.inventory).to eq ({@item1 => 30, @item2 => 25})
  end

  it 'can check the stock of items in the inventory' do
    expect(@food_truck.check_stock(@item1)).to eq 0

    @food_truck.stock(@item1, 30)

    expect(@food_truck.check_stock(@item1)).to eq 30
    
    @food_truck.stock(@item2, 25)
    
    expect(@food_truck.check_stock(@item2)).to eq 25
  end

end