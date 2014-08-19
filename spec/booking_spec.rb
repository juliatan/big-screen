require 'booking'

describe Booking do

  let(:seat1) { Seat.new(1, 2) }
  let(:seat2) { Seat.new(1, 3)}
  let(:booking) { Booking.new(seat1, seat2)}
  # 0,77:23,77:24

  context 'when initialized' do
    it 'has a starting seat' do
      expect(booking.start_seat.row).to eq 1
      expect(booking.start_seat.number).to eq 2
    end

    it 'can have a finishing seat' do
      expect(booking.finish_seat.row).to eq 1
      expect(booking.finish_seat.number).to eq 3
    end
  end

  context 'when validating' do

    let(:seat3) { Seat.new(1, 7) }

    it 'has one seat' do
      expect(Booking.new(seat1).seat_count).to eq 1
    end

    it 'can have more than one seat' do
      expect(Booking.new(seat1, seat2).seat_count).to eq 2
    end

    it 'cannot have more than five seats' do
      expect{ Booking.new(seat1, seat3) }.to raise_error
    end

  end


end