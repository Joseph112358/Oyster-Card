# Oyster card
The project is a test driven, object orientated approach modelling the oyster card system used by London transport.

## Getting started
1. Clone this repository `git clone https://github.com/Joseph112358/Oyster-Card.git`
2. Change into the 'Oyster-Card' directory (e.g. `cd Oyster-Card`)
3. Install dependencies `install bundle` (e.g. `bundle`)

## Usage
`command_to_start` (e.g. `rackup` or `rails s`)
Navigate to `http://localhost:4567/`


## Running tests
1. Change into the 'Oyster-Card' directory (e.g. `cd Oyster-Card`)
2. Run RSpec `rspec`, for clearer format, run `rspec --format documentation`

## User stories
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## Progress tracker

### Set up the project:
- [x] Create a Gemfile
- [x] Create Rspec files, and run empty test
- [x] Review debugging basics
### Create a basic Oyster card:
- [x] Add Balance
- [x] Enable top up functionality 
- [x] Enforce maximum balance
- [x] Deduct the money
### Add touch in/out functionality:
- [x] Add touch in/out support
- [x] Checking minimum balance on touch in
- [x] Charging for the journey
### Record the journeys
- [ ] Saving the entry station
- [ ] Adding the journey history
- [ ] Creating the station class
### Creating the station class
- [ ] Handling a journey without a touch out
### Refactoring: get the code into shape
- [ ] Extracting the journey log out of the Oystercard
### Make fares depends on zones
- [ ] Calculating the fare between zones
