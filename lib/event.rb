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

  # sorted_item_list => Array with a list of names (no dupes) of all items that foodtrucks have in stock, alpha order
  # total_inventory => Hash with Items as keys and sub-hash as values.  Subhash should contain quantity and food_truck keys
  #overstock_items => Array of Item objects.
end