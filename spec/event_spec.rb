require 'spec_helper'

RSpec.describe Event do
  describe "can initialize" do
    event = Event.new("South Pearl Street Farmers Market")
    it "can instantiate itself" do
      expect(event).to be_a Event
    end
    it "has a name" do
      expect(event.name).to eq("South Pearl Street Farmers Market")
    end
    it "has an empty array of Food Trucks" do
      expect(event.food_trucks).to eq([])
    end
  end

  describe "can manage Food Trucks" do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    it "can add a food truck" do
      event.add_food_truck(food_truck1)
      expect(event.food_trucks).to eq([food_truck1])
    end

    it "can add multiple food trucks" do
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
      expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
    end

    it "can return a list the names of all food trucks" do
      expect(event.food_truck_names).to eq (["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it "can return a list of each food truck that sells a specific item" do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)

      expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
      expect(event.food_trucks_that_sell(item2)).to eq([food_truck1])
      expect(event.food_trucks_that_sell(item3)).to eq([food_truck2])
      expect(event.food_trucks_that_sell(item4)).to eq([food_truck2])
    end
  end

end