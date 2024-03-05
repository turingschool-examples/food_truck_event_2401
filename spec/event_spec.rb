require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Class do
  let (:instance) { Class.new }

  describe '#initialize' do
    it 'exists' do
      expect(instance).to be_a(Class)
    end
  end
end