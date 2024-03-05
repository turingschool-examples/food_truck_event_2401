**Iteration One: **


pry(main)> food_truck.check_stock(item1)
#=> 0

pry(main)> food_truck.stock(item1, 30)

pry(main)> food_truck.inventory
#=> {#<Item:ONE> => 30}

pry(main)> food_truck.check_stock(item1)
#=> 30

pry(main)> food_truck.stock(item1, 25)

pry(main)> food_truck.check_stock(item1)
#=> 55

pry(main)> food_truck.stock(item2, 12)

pry(main)> food_truck.inventory
#=> {#<Item:ONE> => 55, #<Item:TWO> => 12}
