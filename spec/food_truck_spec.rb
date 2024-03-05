require './lib/item'
require './lib/event'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  describe "#initialize" do
  it "exists" do
    expect(@food_truck).to be_a(FoodTruck)
  end

  it "has attributes" do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
    expect(@food_truck.inventory).to eq({})
  end
end

end
