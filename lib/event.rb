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
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item_name)
    @food_trucks.select {|truck| truck.inventory.include?(item_name)}
  end

  def sorted_item_list
    item_names = []
    @food_trucks.each do |food_truck|
      inventory = food_truck.inventory

      inventory.each do |item, quantity|
        false unless item_names.include?(item.name)
          item_names << item.name
      end
    end
    item_names.sort!.uniq!
  end

  def total_inventory
    inventory_hash = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if inventory_hash[item]
          inventory_hash[item][:quantity] += quantity
          inventory_hash[item][:food_trucks] << truck unless inventory_hash[item][:food_trucks].include?(truck)
        else
          inventory_hash[item] = {quantity: quantity, food_trucks: [truck]}
        end
      end
    end
    inventory_hash
  end

  def overstock_items
    overstocked_items = total_inventory.select do |item, info|
      info[:quantity] > 50 && info[:food_trucks].size > 1
    end
    overstocked_items.keys
  end
end
  