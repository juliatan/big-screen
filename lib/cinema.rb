class Cinema

  def load_booking_requests(filename, theatre)
    booking_data = File.open(filename, 'r')
    process(booking_data, theatre)
  end

  def identify_seat_row(seats_array, position)
    # position = 0 for start_seat, 1 for finish_seat
    row_string = seats_array[position].match(/(.*)\:/) && $1.to_i
    row_string.to_i # since Seat initialization deals with integers
  end

  def identify_seat_number(seats_array, position)
    # position = 0 for start_seat, 1 for finish_seat
    number_string = seats_array[position].match(/\:(.*)/) && $1
    number_string.to_i # since Seat initialization deals with integers
  end

  def create_seat_from_booking_data(seats_array, position)
    row = identify_seat_row(seats_array, position)
    number = identify_seat_number(seats_array, position)
    Seat.new(row, number)
  end

  def create_booking_from_booking_data(seats_array)
    start_seat = create_seat_from_booking_data(seats_array, 0)
    finish_seat = create_seat_from_booking_data(seats_array, 1)
    booking = Booking.new(start_seat, finish_seat)
  end

  def process(booking_data, theatre)
    booking_data.each_line do |line| # line = "(0,89:13,89:13)"
      seats = line.scan(/,(.+)\)/).flatten[0].split(',') # ["89:13", "89:13"]
      booking = create_booking_from_booking_data(seats)
      theatre.process(booking)
    end
  end

end