require './lib/item'
require 'rspec'

RSpec.describe Item do
  it 'sets the name and price' do 
    item_attributes = { name: "Peach Pie (Slice)", price: "$3.75"}
    item = Item.new(item_attributes)

    expect(item.name).to eq('Peach Pie (Slice)')
    expect(item.price).to eq(3.75)
  end
end