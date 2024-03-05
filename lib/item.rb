class Item
    attr_reader :name, :price

    def initialize(item_info)
        @name = item_info[:name]
        @price = price_formatter(item_info[:price])
    end

    def price_formatter(price_string)
        price_string.delete("$").to_f
    end
end