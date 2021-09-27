require_relative "../lib/oyster_card.rb"

describe Oyster_card do
  it 'checks the balance is zero at initialisation' do
    
    expect(subject.balance).to eq 0
  end
  it 'tops up account by £10' do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end
  it 'raise error if balance exceeds £90' do
    maximum_balance = Oyster_card::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect {subject.top_up(1)}.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end
end
