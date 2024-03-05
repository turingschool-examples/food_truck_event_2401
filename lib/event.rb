class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def sorted_item_list
    all_items = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, _|
        all_items << item.name
      end
    end
    all_items.uniq.sort
  end

  def total_inventory
    total_inventory = Hash.new
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity| 
        total_inventory[item] = {quantity: 0, food_trucks: []}
      end
    end

    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        total_inventory[item][:quantity] += quantity
        total_inventory[item][:food_trucks] << food_truck
      end
    end
    total_inventory
  end

  def overstock_items
    overstock_items = []
    total_inventory.each do |item, details|
      if details[:food_trucks].count > 1 && details[:quantity] > 50
        overstock_items << item
      end
    end
    overstock_items
  end
end