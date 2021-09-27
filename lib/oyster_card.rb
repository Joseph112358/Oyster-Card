class Oyster_card
  MAXIMUM_BALANCE = 90  
  attr_reader :balance


  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail "Insufficient funds" if @balance < 1
    @in_journey = true
    return "In use"
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  # def check_balance
  #   @balance
  # end
 end