# require 'theatre'

# describe Theatre do

#   context 'only accepts bookings' do

#     let(:seat1) { Seat.new(1, 2) }
#     let(:seat2) { Seat.new(1, 4) }

#     it 'one seat can be requested' do
#       booking = Booking.new(seat1)
#       # booking.add_to_reserve_list
#       expect(booking.reserved_seats.count).to eq 1
#     end

#     it 'more than one seat can be requested' do
#       booking = Booking.new(seat1, seat2)
#       # booking.add_to_reserve_list
#       expect(booking.reserved_seats.count).to eq 3
#     end

#   end

# end