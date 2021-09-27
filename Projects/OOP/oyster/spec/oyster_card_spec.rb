require_relative "../lib/oyster_card.rb"

describe Oyster_card do
  it 'checks the balance is zero at initialisation' do
    
    expect(subject.balance).to eq 0
  end
end
