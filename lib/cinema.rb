class Cinema

  def load_booking_requests(filename, theatre)
    contents = File.open(filename, 'r')
    contents.each_line do |line| # line = "(0,89:13,89:13)"
      seats = line.scan(/,(.+)\)/).flatten[0].split(',') # ["89:13", "89:13"]
      start_seat_row = seats[0].match(/(.*)\:/) && $1 # "89"
      start_seat_number = seats[0].match(/(.*)\:/) && $1 # "13"
      finish_seat_row = seats[1].match(/(.*)\:/) && $1
      finish_seat_number = seats[1].match(/(.*)\:/) && $1
      start_seat = Seat.new(start_seat_row.to_i, start_seat_number.to_i)
      finish_seat = Seat.new(finish_seat_row.to_i, finish_seat_number.to_i)
      booking = Booking.new(start_seat, finish_seat)
      theatre.process(booking)
    end
  end

end