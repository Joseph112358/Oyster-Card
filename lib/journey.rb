require "oyster_card"

class Journey
  PENALTY_FARE = 5
  attr_reader :trip_history

  def initialize
    @trip_history = {}
  end

  def add_entry_station(entry_station)
    @trip_history.store(:entry, entry_station)
  end

  def add_exit_station(exit_station)
    @trip_history.store(:exit, exit_station)
  end

  def finish(station)
    @trip_history
  end
end

#starting a journey
#finish a journey
#calculating the fare of a journey
#calculating whether the journey is complete
