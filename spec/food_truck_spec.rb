require 'pry'
require 'rspec'
require './lib/item'
require './lib/food_truck'

describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists' do
    expect(@food_truck).to be_a FoodTruck
  end

  it 'can return attributes' do
    expect(@food_truck.name).to eq "Rocky Mountain Pies"
  end
end