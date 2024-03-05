require './lib/item'
require './lib/event'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
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

  describe "#methods" do
    it "can check stock of an item" do
      expect(@food_truck.check_stock(@item1)).to eq(0)
    end

    it "can stock items" do
      @food_truck.stock(@item1, 30)

      expect(@food_truck.inventory).to eq({@item1 => 30})
      expect(@food_truck.check_stock(@item1)).to eq(30)

      @food_truck.stock(@item1, 25)

      expect(@food_truck.check_stock(@item1)).to eq(55)

      @food_truck.stock(@item2, 12)

      expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
    end

    it "can calculate a food trucks potential revenue" do
      expect(@food_truck1.potential_revenue).to eq(148.75)
      expect(@food_truck2.potential_revenue).to eq(345.00)
      expect(@food_truck3.potential_revenue).to eq(243.75)
    end
  end

end
