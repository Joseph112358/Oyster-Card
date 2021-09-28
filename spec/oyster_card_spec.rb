require_relative "../lib/oyster_card.rb"

describe Oyster_card do
  let(:maximum_balance) {Oyster_card::MAXIMUM_BALANCE}
  let(:minimum_charge) {Oyster_card::MINIMUM_CHARGE}
  let(:station) {double :station}

  it 'checks the balance is zero at initialisation' do
    
    expect(subject.balance).to eq 0
  end

  describe '.top_up' do
    it 'tops up account by £10' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    it 'raise error if balance exceeds £90' do
      subject.top_up(maximum_balance)
      expect {subject.top_up(1)}.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

  # it 'deducts £15 from account' do
  #   subject.top_up(maximum_balance)
  #   subject.deduct(15)
  #   expect(subject.balance).to eq 75
  # end

  describe '.touch_in' do
    it 'sets card as in use' do
      subject.top_up(10)
      expect(subject.touch_in(station)).to eq "In use"
    end

    it 'checks if card is in_journey?' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end

    it 'returns error if balance < minimum_charge' do
      expect {subject.touch_in(station)}.to raise_error "Insufficient funds"
    end
  end
  

  describe '.touch_out' do
    it 'set card as not in use' do 
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end

    it 'reduces balance by min amount £1' do
      subject.top_up(10)
      subject.touch_in(station)
      expect {subject.touch_out}.to change{subject.balance}.by(- minimum_charge)
    end
  end

  describe 'station' do 
    it 'stores visited stations' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  # it 'returns balance when run' do
  #   expect(subject.check_balance).to eq 0
  # end

end
