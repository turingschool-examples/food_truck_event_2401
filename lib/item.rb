class Item 
attr_reader :name, :price
attr_accessor :amount_in_stock

def initialize(item_info)
  @name = item_info[:name]
  @price = item_info[:price]
end
end