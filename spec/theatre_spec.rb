require 'theatre'

describe Theatre do

  let(:seat1) { Seat.new(1, 2) }
  let(:seat2) { Seat.new(1, 4) }
  let(:seat3) { Seat.new(2, 2) }
  let(:seat4) { Seat.new(2, 4) }
  let(:booking1) { Booking.new(seat1, seat2) }
  let(:booking2) { Booking.new(seat3, seat4) }
  let(:theatre) { Theatre.new }

  it 'can add a valid booking to reserve list' do
    theatre.process(booking1)
    expect(theatre.reserved_seats.count).to eq 3
  end

  it 'knows the number of valid bookings it has reserved' do
    theatre.process(booking1)
    expect(theatre.reserved_bookings.count).to eq 1
  end

  it 'knows all of the first seats of each reserved booking' do
    theatre.process(booking1)
    theatre.process(booking2)
    expect(theatre.first_seats_reserved).to eq [seat1, seat3]
  end

  it 'knows all of the last seats of each reserved booking' do
    theatre.process(booking1)
    theatre.process(booking2)
    expect(theatre.last_seats_reserved).to eq [seat2, seat4]
  end

  context 'adds discards bookings if' do

    let(:seat5) { Seat.new(1, 4) }
    let(:seat6) { Seat.new(1, 6) }
    let(:booking3) { Booking.new(seat5) }
    let(:booking4) { Booking.new(seat6) }

    it 'any of the requested seats is in the reserve list' do
      theatre.process(booking1)
      theatre.process(booking3)
      expect(theatre.reserved_seats.count).to eq 3
      expect(theatre.discarded_bookings.count).to eq 1
    end

    # it 'a single seat gap is left' do
    #   theatre.process(booking1)
    #   theatre.process(booking4)
    #   expect(theatre.reserved_seats.count).to eq 3
    #   expect(theatre.discarded_bookings.count).to eq 1
    # end
  end

end