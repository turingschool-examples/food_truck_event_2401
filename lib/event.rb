class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |truck| truck.check_stock(item) > 0 }
  end

  def sorted_item_list
    @food_trucks.flat_map(&:list_of_item_names).uniq.sort
  end

  def list_all_items
    @food_trucks.flat_map(&:in_stock_items_list).uniq
  end

  # def total_inventory
  #   inventory = Hash.new { |hash, key| hash[key] = {}}
  #   @food_trucks.each do |truck|
  #     truck.inventory.each do |item, amount|
  #       inventory[item] = {
  #         quantity: amount,
  #         food_trucks: food_trucks_that_sell(item)
  #       }
  #     end
  #   end
  #   inventory
  # end

  def total_stock(item)
    @food_trucks.sum do |truck|
      truck.inventory[item]
    end
  end

  def overstock_items
    list_all_items.select do |item|
      food_trucks_that_sell(item).count > 1 &&
      total_stock(item) > 50
    end
  end
end
