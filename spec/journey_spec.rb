require_relative "../lib/journey.rb"
require "oyster_card"

describe Journey do
  let(:station) { double :station, zone: 1 }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
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
      subject.add_entry_station(entry_station)
      subject.add_exit_station(exit_station)
    end

    it "stores 1 journey in trip_history" do
      expect(subject.trip_history).to include journey
    end
    it "adds an entry station to trip history" do
      expect(subject.add_entry_station(entry_station)).to eq entry_station
    end

    it "adds an exit station to trip history" do
      expect(subject.add_exit_station(exit_station)).to eq exit_station
    end
    it "returns trip_history when journey is finished" do
      expect(subject.finish(station)).to eq subject.trip_history
    end
  end

  # describe "output finished journey" do
  #   it "returns trip_history when journey is finished" do
  #     j = Journey.new
  #     j.add_entry_station(entry_station)
  #     j.add_exit_station(exit_station)
  #     expect(j.finish(station)).to eq j.trip_history
  #   end
  # end
end
