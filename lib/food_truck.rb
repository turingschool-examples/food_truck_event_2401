class FoodTruck

  attr_reader :name
  attr_accessor :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item, number)
      @inventory[item] += number
  end

  def check_stock(item) 
    stock_array = @inventory.map {|item, number| number}
    stock_array.sum
  end

  def potential_revenue
    price_stock_hash = Hash.new(0)
    @inventory.each do |item, number|
      price_stock_hash[item] = number * item.price
    end

    price_stock_hash.map {|k, v| v}.sum
  end
end