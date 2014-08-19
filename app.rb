require './lib/seat'
require './lib/booking'
require './lib/theatre'
require './lib/cinema'

@cinema = Cinema.new
@theatre = Theatre.new

# @seat1 = Seat.new(0,0)
# @seat2 = Seat.new(0,1)
# @seat3 = Seat.new(0,2)
# @seat4 = Seat.new(0,4)

# @booking1 = Booking.new(@seat1, @seat2)
# @booking2 = Booking.new(@seat3, @seat4)

# @theatre.process(@booking1)
# @theatre.process(@booking2)

# # test no overlapping seats
# @seat5 = Seat.new(0,0)
# @booking3 = Booking.new(@seat5)

# #test no single gaps
# @seat6 = Seat.new(0,6)
# @booking4 = Booking.new(@seat6)

@cinema.load_booking_requests('sample_booking_requests.txt', @theatre)
puts "Discarded: #{@theatre.discarded_bookings.count}"
puts "Reserved: #{@theatre.reserved_bookings.count}"
p @theatre.discarded_bookings