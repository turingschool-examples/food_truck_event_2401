require 'pry'
require 'rspec'
require './lib/item'
require './lib/food_truck'

describe Item do
  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do
    expect(@item).to be_an Item
  end
end