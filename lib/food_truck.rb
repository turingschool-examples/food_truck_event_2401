class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    inventory[item] ||= 0
  end

  def stock(item, quantity)
    inventory[item] ||= 0
    inventory[item] += quantity
  end

  #all item prices times the quantity of items
  # quantity * price = pr
  # sum all pr together
  def potential_revenue
    @inventory.map do |invo|
    invo.price * invo.quantity
    end
  end

end
