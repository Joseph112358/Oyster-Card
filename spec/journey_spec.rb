require_relative "../lib/journey.rb"
require "oyster_card"

describe Journey do
  let(:station) { double :station, zone: 1}
  let(:entry_station) {double :station}
  let(:exit_station) { double :station }
  let(:journey){ {entry: entry_station, exit: exit_station} }
  
  describe "start / finish journey" do
  

  it 'stores 1 journey in trip_history' do
     card = Oyster_card.new  
      card.top_up(10)
     card.touch_in(entry_station)
    card.touch_out(exit_station)
    expect(card.trip_history).to include journey

  end
end
end