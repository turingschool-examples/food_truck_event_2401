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
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack") 
  end

  describe '#initialize' do
    it 'defaults' do
      expect(@event.name).to eq("South Pearl Street Farmers Market")
      expect(@event.food_trucks).to eq([])
    end
  end

  describe '#what is in food trucks' do
    it 'displays what is in food truck 1' do
      @food_truck1.stock(@item1, 35)    
      @food_truck1.stock(@item2, 7) 

      expect(@food_truck1.inventory).to eq({@item1 => 35, @item2 => 7})
    end

    it 'displays what is in food truck 2' do 
      @food_truck2.stock(@item4, 50)    
      @food_truck2.stock(@item3, 25)

      expect(@food_truck2.inventory).to eq({@item4 => 50, @item3 => 25})
    end

    it 'displays what is in food truck 3' do 
      @food_truck3.stock(@item1, 65)

      expect(@food_truck3.inventory).to eq({@item1 => 65})
    end
  end
  
  describe '#add food trucks' do
    it 'add  food truck' do
      @event.add_food_truck(@food_truck1)    
      @event.add_food_truck(@food_truck2)    
      @event.add_food_truck(@food_truck3)
      
      expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
      expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#food trucks that sell' do
    it 'displays what food trucks sell' do
      @food_truck1.stock(@item1, 35)    
      @food_truck1.stock(@item2, 7) 
      @food_truck2.stock(@item4, 50)    
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65)
      @event.add_food_truck(@food_truck1)    
      @event.add_food_truck(@food_truck2)    
      @event.add_food_truck(@food_truck3)
      
      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
      expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
    end
  

    it 'displays the potential revenue of each' do 
      @food_truck1.stock(@item1, 35)    
      @food_truck1.stock(@item2, 7) 
      @food_truck2.stock(@item4, 50)    
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65)
      @event.add_food_truck(@food_truck1)    
      @event.add_food_truck(@food_truck2)    
      @event.add_food_truck(@food_truck3)

      expect(@food_truck1.potential_revenue).to eq(148.75)
      expect(@food_truck2.potential_revenue).to eq(345.00)
      expect(@food_truck3.potential_revenue).to eq(243.75)
    end

    it 'sorts items alphebetically' do 
      @food_truck1.stock(@item1, 35)    
      @food_truck1.stock(@item2, 7) 
      @food_truck2.stock(@item4, 50)    
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65)
      @event.add_food_truck(@food_truck1)    
      @event.add_food_truck(@food_truck2)    
      @event.add_food_truck(@food_truck3)

      expect(@event.sorted_item_list).to eq(["Apple Pie (Slice)", "Peach Pie (Slice)", "Banana Nice Cream", "Peach-Raspberry Nice Cream", "Peach Pie (Slice)"])
    end

    it 'has overstock items' do 
      @food_truck1.stock(@item1, 35)    
      @food_truck1.stock(@item2, 7) 
      @food_truck2.stock(@item4, 50)    
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65)
      @event.add_food_truck(@food_truck1)    
      @event.add_food_truck(@food_truck2)    
      @event.add_food_truck(@food_truck3)

      expect(@event.total_inventory).to eq({
          @item1 => {
            amount: 100,
            food_trucks: [@food_truck1, @food_truck3]
          },
          @item2 => {
            amount: 7,
            food_trucks: [@food_truck1]
          },
          @item3 => {
            amount: 25,
            food_trucks: [@food_truck2]
          },
          @item4 => {
            amount: 50,
            food_trucks: [@food_truck2]
          }
          
        })
          

    end
  end 
end