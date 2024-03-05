require 'pry'
require 'rspec'
require './lib/event'
require './lib/item'
require './lib/food_truck'

describe Event do
  before :each do
    @event = Event.new
  end

  it 'exists' do
    expect(@event).to be_an Event
  end
end
