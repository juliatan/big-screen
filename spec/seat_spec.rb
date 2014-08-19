require 'seat'

describe Seat do

  context 'when initialized' do

    let(:seat) { Seat.new(1) }

    it 'has a row' do
      expect(seat.row).to eq 1
    end
  end

end