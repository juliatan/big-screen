require './lib/seat'
require './lib/booking'
require './lib/theatre'

@theatre = Theatre.new
@seat1 = Seat.new(0,0)
@seat2 = Seat.new(0,1)
@seat3 = Seat.new(1,2)
@seat4 = Seat.new(1,4)

@booking1 = Booking.new(@seat1, @seat2)
@booking2 = Booking.new(@seat3, @seat4)

@seat5 = Seat.new(0,0)
@booking3 = Booking.new(@seat5)


