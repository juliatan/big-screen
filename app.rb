require './lib/seat'
require './lib/booking'
require './lib/theatre'
require './lib/cinema'

@cinema = Cinema.new
@theatre1 = Theatre.new
@theatre2 = Theatre.new

puts 'Loading SAMPLE booking requests'

@cinema.load_booking_requests('sample_booking_requests.txt', @theatre1)
puts '*' * 35

puts "Discarded bookings: #{@theatre1.discarded_bookings.count}"
puts "Sucessful bookings: #{@theatre1.reserved_bookings.count}"
puts "Total bookings in file: #{@theatre1.bookings.count}"

puts '-' * 35
puts "\n"

puts 'Now loading ACTUAL booking requests'

@cinema.load_booking_requests('booking_requests.txt', @theatre2)
puts '*' * 35

puts "Discarded bookings: #{@theatre2.discarded_bookings.count}"
puts "Sucessful bookings: #{@theatre2.reserved_bookings.count}"
puts "Total bookings in file: #{@theatre2.bookings.count}"

puts '-' * 35