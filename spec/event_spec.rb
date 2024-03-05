describe Event do
  before :each do
    @event = Event.new
  end

  it 'exists' do
    expect(@event).to be_an Event
  end
end
