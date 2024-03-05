require "date"

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
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.filter do |food_truck|
      food_truck.check_stock(item).positive?
    end
  end

  def sorted_item_list
    @food_trucks.map do |food_truck|
      food_truck.inventory.keys.map(&:name)
    end.flatten.uniq.sort
  end

  def total_inventory
    @food_trucks.each_with_object(Hash.new do |hash, key|
      hash[key] = { quantity: 0, food_trucks: [] }
    end) do |food_truck, inventory|
      food_truck.inventory.each do |item, quantity|
        inventory[item][:quantity] += quantity
        inventory[item][:food_trucks] << food_truck
      end
    end
  end

  def overstock_items
    overstock_items_list = []
    total_inventory.each do |item, item_info|
      if item_info[:quantity] > 50 && item_info[:food_trucks].length > 1
        overstock_items_list << item
      end
    end
    overstock_items_list
  end

  def date
    Date.today.strftime("%d/%m/%Y")
  end

  def sell(item, quantity)
    return false if total_inventory[item][:quantity] < quantity

    total_inventory[item][:food_trucks].each do |food_truck|
      amt_sold_from_truck = [food_truck.check_stock(item), quantity].min
      food_truck.inventory[item] -= amt_sold_from_truck
      quantity -= amt_sold_from_truck
    end

    true
  end
end
