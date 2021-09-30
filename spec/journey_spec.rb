require_relative "../lib/journey.rb"
require "oyster_card"

describe Journey do
  let(:station) { double :station, zone: 1 }
  let(:entry_station) { double :stationA }
  let(:exit_station) { double :stationB }
  let(:journey) { { entry: entry_station, exit: exit_station } }

  it "expects an empty list of journeys" do
    expect(subject.trip_history).to be_empty
  end

  # it 'checks if card is in_journey?' do
  #   subject.top_up(10)
  #   subject.touch_in(entry_station)
  #   expect(subject.in_journey?).to eq true
  # end

  describe "start / finish journey" do
    before(:each) do
      @card = Oyster_card.new
      @card.top_up(10)
      @card.touch_in(entry_station)
      @card.touch_out(exit_station)
      #subject.add_entry_station(entry_station)
      #subject.add_exit_station(exit_station)
    end

    # it "stores 1 journey in trip_history" do
    #   subject.add_entry_station(entry_station)
    #   subject.add_exit_station(exit_station)
    #   expect(subject.journeys).to eq 
    # end
    it "adds an entry station to trip history" do
      expect(subject.add_entry_station(entry_station)).to eq entry_station
    end

    it "adds an exit station to trip history" do
      expect(subject.add_exit_station(exit_station)).to eq subject.journeys
    end
    it '#finish returns itself'do
      expect(subject.finish(station)).to eq(subject)
  end

  end
  describe "journey class" do
      before(:each) do
        @card = Oyster_card.new
        @card.top_up(10)
        @card.touch_in(entry_station)
        @card.touch_out(exit_station)
        subject.add_entry_station(entry_station)
    end
    it "returns penalty fare" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
    it 'returns normal fee (if trip complete)' do
      subject.add_exit_station(exit_station)
      expect(subject.fare).to eq 1
    end
  end


end
