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
    @food_trucks.flat_map do |food_truck|
      food_truck.inventory.map do |item, amount| 
       item.name
      end
    end.uniq.sort
  end

  def total_inventory
    amount_of_items = Hash.new { |hash, key| hash[key] = {amount: 0, food_trucks: []}}
    @food_trucks.each do |food_truck| 
      food_truck.inventory.each do |item, amount|
        amount_of_items[item][:amount] += amount
        amount_of_items[item][:food_trucks] << food_truck
      end
    end
    amount_of_items
  end

  # def overstock_items
  #   @food_trucks.each do |food_truck|
  #     food_truck.inventory.each do |item| 
  #       if item > 50 && 
  #     end
  #   end
  # end
end