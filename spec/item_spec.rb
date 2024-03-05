require './lib/item'
require './lib/event'
require './lib/food_truck'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  describe "#initialize" do
    it "exists" do

    end

    it "has attributes" do

    end
  end

end
