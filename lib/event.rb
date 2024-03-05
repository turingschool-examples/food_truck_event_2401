class Event
    attr_reader :name, :food_trucks

    def initialize(name)
        @name = name
        @food_trucks = Array.new
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
        trucks_selling_item = Array.new
        @food_trucks.each do |food_truck|   # This could probably be refactored using map - I was experimenting with it :)
            if food_truck.inventory.include?(item)
                trucks_selling_item << food_truck
            end
        end
        trucks_selling_item
    end

    def sorted_item_list
        item_list = Array.new
        @food_trucks.each do |food_truck|
            food_truck.inventory.each do |item, value|
                if !item_list.include?(item)
                    item_list << item.name
                end
            end
        end
        item_list.sort
    end

end