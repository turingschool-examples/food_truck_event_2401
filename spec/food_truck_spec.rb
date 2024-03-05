require './lib/item'
require './lib/event'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  describe "#initialize" do
  it "exists" do

  end

  it "has attributes" do

  end
end

end


pry(main)>
#=> #<Item:0x007f9c56740d48...>

pry(main)>
#=> #<Item:0x007f9c565c0ce8...>

pry(main)> item2.name
#=> "Apple Pie (Slice)"

pry(main)> item2.price
#=> 2.50

pry(main)>
#=> #<FoodTruck:0x00007f85683152f0...>

pry(main)> food_truck.name
#=> "Rocky Mountain Pies"

pry(main)> food_truck.inventory
#=> {}

pry(main)> food_truck.check_stock(item1)
#=> 0

pry(main)> food_truck.stock(item1, 30)

pry(main)> food_truck.inventory
#=> {#<Item:0x007f9c56740d48...> => 30}

pry(main)> food_truck.check_stock(item1)
#=> 30

pry(main)> food_truck.stock(item1, 25)

pry(main)> food_truck.check_stock(item1)
#=> 55

pry(main)> food_truck.stock(item2, 12)

pry(main)> food_truck.inventory
#=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
