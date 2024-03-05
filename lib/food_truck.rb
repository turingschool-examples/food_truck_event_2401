class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] = quantity
  end

  def potential_revenue
    @inventory.sum do |item, quantity|
      item.price * quantity
    end
  end

  def in_stock_items_list
    in_stock = []
    @inventory.each do |item, quantity|
      in_stock << item if quantity > 0
    end
    in_stock
  end

  def list_of_item_names
    in_stock_items_list.map(&:name)
  end
end
