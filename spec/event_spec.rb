require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  before(:each) do
  @event = Event.new("South Pearl Street Farmers Market") 
  @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
  @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
  @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
  @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

end

  describe '#initialize' do
    it 'defaults' do
      expect(@event.name).to eq("South Pearl Street Farmers Market")
      expect(@event.food_trucks).to eq([])
    end
  end
  describe '#food truck 1' do
    it 'displays what is in the food truck' do
      @food_truck1.stock(@item1, 35)    
      @food_truck1.stock(@item2, 7) 

      expect(@food_truck1.inventory).to eq({@item1 => 35, @item2 => 7})
    end
  end
end