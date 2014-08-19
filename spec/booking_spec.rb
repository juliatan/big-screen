require 'booking'

describe Booking do

  context 'when initialized' do

    let(:seat1) { Seat.new(1, 2) }
    let(:seat2) { Seat.new(1, 3) }
    let(:booking) { Booking.new(seat1, seat2)}
    # 0,77:23,77:24

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
  end

  context 'when validating' do

    # remember that rows and seat numbers are 0-indexed
    let(:seat1) { Seat.new(1, 2) }
    let(:seat2) { Seat.new(1, 7) }
    let(:seat3) { Seat.new(2, 3) }
    let(:seat4) { Seat.new(0, 1) }
    let(:seat5) { Seat.new(0, 48) }

    it 'cannot have more than five seats' do
      expect{ Booking.new(seat1, seat2) }.to raise_error
    end

    it 'must be in the same row' do
      expect{ Booking.new(seat1, seat3) }.to raise_error
    end

    context 'cannot leave a single seat gap' do
      it 'cannot start on second seat in any row' do
        expect{ Booking.new(seat4) }.to raise_error
      end

      it 'cannot end on second last seat in any row' do
        expect{ Booking.new(seat5) }.to raise_error
      end
    end
  end

  context 'if valid' do

    let(:seat1) { Seat.new(1, 2) }
    let(:seat2) { Seat.new(1, 4) }

    it 'one seat can be reserved' do
      booking = Booking.new(seat1)
      booking.add_to_reserve_list
      expect(booking.reserved_seats.count).to eq 1
    end

    it 'more than one seat can be reserved' do
      booking = Booking.new(seat1, seat2)
      booking.add_to_reserve_list
      expect(booking.reserved_seats.count).to eq 3
    end

  end




end