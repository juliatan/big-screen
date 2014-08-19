require 'theatre'

describe Theatre do

  context 'when validating bookings' do

    let(:seat1) { Seat.new(1, 2) }
    let(:seat2) { Seat.new(1, 4) }
    let(:booking) { Booking.new(seat1, seat2) }
    let(:theatre) { Theatre.new }

    it 'can authorise a valid booking' do
      theatre.authorise(booking)
      expect(theatre.reserve_list.count).to eq 3
    end
  end

end