class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = Hash.new(0)
    end

    def stock(item, quantity)
        @inventory[item] += quantity
    end

    def check_stock(item)
        if @inventory.include?(item)
            @inventory[item]
        else
            return 0
        end
    end

    def potential_revenue
        sum = 0
        @inventory.each do |item, value|
            sum += item.price * value
        end
        sum
    end

end