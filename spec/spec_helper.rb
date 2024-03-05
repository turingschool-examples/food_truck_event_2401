require "rspec"
require "pry"
require "simplecov"
require "./lib/item"
require "./lib/food_truck"
require "./lib/event"

SimpleCov.start

RSpec.configure do |config|
  config.formatter = :documentation
end
