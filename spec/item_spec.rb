require 'rspec'
require './lib/item.rb'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Item do
    it "Item exists" do
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        expect(item1).to be_a Item
    end

    it "Item has a name" do
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        expect(item1.name).to eq "Peach Pie (Slice)"
    end

    it "Item has a price" do
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        expect(item1.price).to eq 3.75
    end
end