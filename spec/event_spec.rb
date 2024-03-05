require 'pry'
require 'rspec'
require './lib/event'
require './lib/item'
require './lib/food_truck'

describe Event do
  before :each do
    @event = Event.new
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists' do
    expect(@event).to be_an Event
  end

  it 'can add food trucks to the event' do
    expect(@event.food_trucks).to eq []
  end
end
