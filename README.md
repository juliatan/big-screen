A cinema has a theatre of 100 rows, each with 50 seats. Customers request particular seats when making a booking.
Bookings are processed on a first-come, first-served basis. A booking is accepted as long as it is for five or fewer
seats, all seats are adjacent and on the same row, all requested seats are available, and accepting the booking would
not leave a single-seat gap (since the cinema believes nobody would book such a seat, and so loses the cinema money).

Write a system to process a text file of bookings (booking_requests) and determine the number of bookings which are
rejected. To test your system, a smaller sample file (sample_booking_requests) is supplied; processing this file should
yield 11 rejected requests.

The text file of bookings contains one booking per line, where a booking is of the following form:
  (<id>,<index of first seat row>:<index of first seat within row>,<index of last seat row>:<index of last seat within row>),
Rows and seats are both 0-indexed. Note the trailing comma is absent on the final line.