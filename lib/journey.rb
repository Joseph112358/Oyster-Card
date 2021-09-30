#require "oyster_card"

class Journey
  PENALTY_FARE = 6
  attr_reader :trip_history
  attr_reader :journeys

  def initialize
    @journeys = []
    @trip_history = {}
    @entry_station
    @exit_station
  end
  
  def add_entry_station(entry_station)
    @trip_history = {}
    @exit_station = nil
    @entry_station = entry_station
    @trip_history.store(:entry, entry_station)
    #@exit_station = nil
  end

  def add_exit_station(exit_station)
    @exit_station = exit_station
    @trip_history.store(:exit, exit_station)
    @journeys.push(@trip_history)
  end
 
  def finish()
    
  end

  def fare()
    if(@entry_station == nil || @exit_station == nil)
      return PENALTY_FARE
    else
      return 1
    end
  end

  def complete?()
     @entry_station && @exit_station
  end
end

class Journey_Log
  def initialize(journey_class)
    @journey_class = journey_class
  end

  def start(entry_station)

  end


end
