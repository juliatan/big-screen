require 'seat'

describe Seat do

  context 'when initialized' do

    let(:seat) { Seat.new(1, 2) }

    it 'has a row' do
      expect(seat.row).to eq 1
    end

    it 'has a number' do
      expect(seat.number).to eq 2
    end
  end



end