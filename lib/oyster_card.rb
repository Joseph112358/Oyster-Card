require_relative 'journey.rb'
require_relative 'station.rb'

class Oyster_card
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1
  attr_reader :balance, :trip_history
  attr_accessor :entry_station
  attr_accessor :exit_station
  attr_accessor :m_journey

  def initialize
    @balance = 0
    #@m_stations = Station.new
    @m_journey = Journey.new
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MINIMUM_CHARGE
    @m_journey.add_entry_station(station)
    
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @m_journey.add_exit_station(station)
    
  end

  def in_journey?
    !!entry_station
  end

  # def check_balance
  #   @balance
  # end

  private

  def deduct(amount)
    @balance -= amount
  end
end
