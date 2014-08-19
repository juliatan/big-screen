require 'booking'

describe Booking do

  let(:seat1) { Seat.new(1, 1) }
  let(:booking) { Booking.new(0, 5, 6, 5, 7)}
  # 0,77:23,77:24

  context 'when initialized' do
    it 'has a unique id' do
      expect(booking.id).to eq 0
    end

    it 'has a starting row' do
      expect(booking.start_row).to eq 5
    end

    it 'has a starting seat' do
      expect(booking.start_seat).to eq 6
    end

    it 'can have a finishing row' do
      expect(booking.finish_row).to eq 5
    end

    it 'can have a finishing seat' do
      expect(booking.finish_seat).to eq 7
    end
  end

  
end