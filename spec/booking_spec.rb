require 'booking'

describe Booking do

  context 'when initialized' do

    let(:seat1) { Seat.new(1, 2) }
    let(:seat2) { Seat.new(1, 3) }
    let(:seat3) { Seat.new(1, 0) }
    let(:seat4) { Seat.new(1, 49) }
    let(:booking) { Booking.new(seat1, seat2)}

    it 'has a starting seat' do
      expect(booking.start_seat.row).to eq 1
      expect(booking.start_seat.number).to eq 2
    end

    it 'can have a finishing seat' do
      expect(booking.finish_seat.row).to eq 1
      expect(booking.finish_seat.number).to eq 3
    end

    it 'has one seat' do
      expect(Booking.new(seat1).seat_count).to eq 1
    end

    it 'can have more than one seat' do
      expect(Booking.new(seat1, seat2).seat_count).to eq 2
    end

    it 'has a valid status if it is valid' do
      expect(booking.status).to eq 'valid'
    end

    it 'knows the adjacent seat before its first seat' do
      expect(booking.previous_seat).to eq '1:1'
    end

    it 'gives n/a if first seat is at index 0' do
      expect(Booking.new(seat3).previous_seat).to eq 'N/A'
    end

    it 'knows the adjacent seat after its last seat' do
      expect(booking.next_seat).to eq '1:4'
    end

    it 'gives n/a if finish seat is at index 49' do
      expect(Booking.new(seat4).next_seat).to eq 'N/A'
    end
  end

  context 'knows its boundaries' do

    let(:seat1) { Seat.new(1, 2) }
    let(:seat2) { Seat.new(1, 3) }
    let(:seat3) { Seat.new(1, 0) }
    let(:seat4) { Seat.new(1, 49) }
    let(:booking) { Booking.new(seat1, seat2)}

    it 'knows the adjacent seat before its first seat' do
      expect(booking.previous_seat).to eq '1:1'
    end

    it 'gives n/a if first seat is at index 0' do
      expect(Booking.new(seat3).previous_seat).to eq 'N/A'
    end

    it 'knows the adjacent seat after its last seat' do
      expect(booking.next_seat).to eq '1:4'
    end

    it 'gives n/a if finish seat is at index 49' do
      expect(Booking.new(seat4).next_seat).to eq 'N/A'
    end
  end

  context 'when validating' do

    # remember that rows and seat numbers are 0-indexed
    let(:seat1) { Seat.new(1, 2) }
    let(:seat2) { Seat.new(1, 7) }
    let(:seat3) { Seat.new(2, 3) }
    let(:seat4) { Seat.new(0, 1) }
    let(:seat5) { Seat.new(0, 48) }
    let(:seat6) { Seat.new(1, 2) }

    it 'cannot have more than five seats' do
      expect(Booking.new(seat1, seat2).status).to eq 'invalid'
    end

    it 'must be in the same row' do
      expect(Booking.new(seat1, seat3).status).to eq 'invalid'
    end

    context 'cannot leave a single seat gap' do
      it 'cannot start on second seat in any row' do
        expect(Booking.new(seat4).status).to eq 'invalid'
      end

      it 'cannot end on second last seat in any row' do
        expect(Booking.new(seat5).status).to eq 'invalid'
      end
    end
  end

  context 'when making seat requests' do

    let(:seat1) { Seat.new(1, 2) }
    let(:seat2) { Seat.new(1, 4) }

    it 'one seat can be requested' do
      booking = Booking.new(seat1)
      expect(booking.requested_seats.count).to eq 1
    end

    it 'more than one seat can be requested' do
      booking = Booking.new(seat1, seat2)
      expect(booking.requested_seats.count).to eq 3
    end
  end
end