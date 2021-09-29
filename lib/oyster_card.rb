class Oyster_card
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1
  attr_reader :balance, :trip_history
  attr_accessor :entry_station
  attr_accessor :exit_station

  def initialize
    @balance = 0
    @entry_station
    @exit_station
    # @trip_history = {}
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MINIMUM_CHARGE
    @entry_station = station
    # @trip_history.store(:entry, station)
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
    @exit_station = station
    # @trip_history.store(:exit, station)
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
