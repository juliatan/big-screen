require 'theatre'

describe Theatre do

  let(:seat1) { Seat.new(1, 2) }
  let(:seat2) { Seat.new(1, 4) }
  let(:seat3) { Seat.new(2, 2) }
  let(:seat4) { Seat.new(2, 4) }
  let(:seat5) { Seat.new(1, 7) }
  let(:seat6) { Seat.new(1, 8) }
  let(:booking1) { Booking.new(seat1, seat2) }
  let(:booking2) { Booking.new(seat3, seat4) }
  let(:booking3) { Booking.new(seat5, seat6) }
  let(:theatre) { Theatre.new }

  it 'can add a valid booking to reserve list' do
    theatre.process(booking1)
    expect(theatre.reserved_seats.count).to eq 3
  end

  it 'knows the number of valid bookings it has reserved' do
    theatre.process(booking1)
    expect(theatre.reserved_bookings.count).to eq 1
  end

  it 'knows the total number of bookings that have been made' do
    theatre.process(booking1)
    theatre.process(booking2)
    expect(theatre.bookings.count).to eq 2
  end

  it 'knows whether two bookings are in the same row' do
    theatre.process(booking1)
    theatre.process(booking3)
    expect(theatre.same_row?(booking1, booking3)).to be true
  end

  it 'knows the size of gap between two bookings in the same row' do
    theatre.process(booking1)
    theatre.process(booking3)
    expect(theatre.gap_between_bookings(booking1, booking3)).to eq 2
  end

  context 'adds to discarded bookings if' do

    let(:seat7) { Seat.new(1, 4) }
    let(:seat8) { Seat.new(1, 6) }
    let(:booking4) { Booking.new(seat3, seat7) }
    let(:booking5) { Booking.new(seat7) }
    let(:booking6) { Booking.new(seat8) }

    it 'booking has an invalid status' do
      theatre.process(booking4)
      expect(theatre.reserved_seats.count).to eq 0
      expect(theatre.discarded_bookings.count).to eq 1
    end

    it 'any of the requested seats is in the reserve list' do
      theatre.process(booking1)
      theatre.process(booking5)
      expect(theatre.reserved_seats.count).to eq 3
      expect(theatre.discarded_bookings.count).to eq 1
    end

    it 'a single seat gap is left within a row' do
      theatre.process(booking1)
      theatre.process(booking6)
      expect(theatre.reserved_seats.count).to eq 3
      expect(theatre.discarded_bookings.count).to eq 1
    end
  end

end