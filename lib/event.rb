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
    food_truck_names = food_trucks.map do |truck|
      truck.name
    end
  end
  
  def food_trucks_that_sell(item)
    selling_trucks = []
    @food_trucks.each do |truck|
      if truck.sell?(item)
        selling_trucks << truck.name
      end
    end
    selling_trucks
  end

  def sorted_item_list
    all_items = []
    @food_trucks.each do |food_truck|
      food_truck.items.each_key do |item_name|
        all_items << item_name unless all_items.include?(item_name)
      end
    end
    all_items.sort
  end

  def overstock_items
    overstocked_items = []
    items_counts =  Hash.new(0)

    @food_trucks.each do |food_truck|
      food_truck.items.each do |item, quantity|
        item_counts[item] =+ quantity
        item_counts.each do |item, total_quantity|
          if @food_trucks.count {|food_truck| food_truck.items.include?(itme)} > 1 && total_quantity > 50
          overstocked_items << item
          end
        end
      end
    end
    
    
  end

  def total_inventory

  end
end