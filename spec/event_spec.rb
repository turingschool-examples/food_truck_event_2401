require 'rspec'
require './lib/event.rb'
require './lib/food_truck.rb'
require './lib/item.rb'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Event do

    it "Event exists" do
        event = Event.new("South Pearl Street Farmers Market")
        expect(event).to be_a Event
    end

    it "Event has a name" do
        event = Event.new("South Pearl Street Farmers Market")
        expect(event.name).to eq "South Pearl Street Farmers Market"
    end

end