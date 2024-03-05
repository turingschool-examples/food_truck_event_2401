class Item
  attr_reader :name, :price

  def initialize (attr_hash)
    @name = attr_hash[:name]
    @price = attr_hash[:price].delete('$').to_f
  end
end