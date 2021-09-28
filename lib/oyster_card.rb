class Oyster_card
  MAXIMUM_BALANCE = 90  
  MINIMUM_CHARGE = 1
  attr_reader :balance
  attr_reader :entry_station



  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MINIMUM_CHARGE
    @in_journey = true
    @entry_station = entry_station
    return "In use"
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  # def check_balance
  #   @balance
  # end

  private

  def deduct(amount)
    @balance -= amount
  end
 end