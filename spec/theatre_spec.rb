require 'theatre'

describe Theatre do

  let(:seat1) { Seat.new(1, 2) }
  let(:seat2) { Seat.new(1, 4) }
  let(:booking1) { Booking.new(seat1, seat2) }
  let(:theatre) { Theatre.new }

  it 'can add a valid booking to reserve list' do
    theatre.process(booking1)
    expect(theatre.reserved_seats.count).to eq 3
  end

  context 'adds discards bookings if' do

    let(:seat3) { Seat.new(1, 4) }
    let(:seat4) { Seat.new(1, 6) }
    let(:booking2) { Booking.new(seat3) }
    let(:booking3) { Booking.new(seat4) }

    it 'any of the requested seats is in the reserve list' do
      theatre.process(booking1)
      theatre.process(booking2)
      expect(theatre.reserved_seats.count).to eq 3
      expect(theatre.discarded_bookings.count).to eq 1
    end

    it 'a single seat gap is left' do
      theatre.process(booking1)
      theatre.process(booking3)
      expect(theatre.reserved_seats.count).to eq 3
      expect(theatre.discarded_bookings.count).to eq 1
    end
  end

end