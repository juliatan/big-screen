require 'booking'

describe Booking do

  let(:seat1) { Seat.new(1, 1) }
  let(:booking) { Booking.new(0)}
  # 0,77:23,77:24

  context 'when initialized' do
    it 'has a unique id' do
      expect(booking.id).to eq 0
    end
  end
end