class FoodTruck
  attr_reader :name

  def initialize (name)
    @inventory = Hash.new(0)
    @name = name
  end

  def inventory
    @inventory
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def check_stock(item)
    @inventory[item]
  end
end