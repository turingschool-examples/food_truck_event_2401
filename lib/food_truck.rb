class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item]
      @inventory[item]
    else
      0
    end
  end

  def stock(item, quantity)
    if @inventory.key?(item)
      @inventory[item] += quantity 
    else 
      @inventory[item] = quantity
    end
  end
  
  def sell?(item)
    @inventory.key?(item)
  end

  def potential_revenue
    @inventory.sum { |item, quantity| item.price * quantity}
  end
end