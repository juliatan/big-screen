class Theatre

  attr_reader :reserved_seats, :discarded_bookings

  def initialize
    @reserved_seats = []
    @discarded_bookings = []
  end

  def process(booking)
    if valid? booking
      booking.requested_seats.each do |requested_seat|
        reserved_seats << requested_seat
      end
    else
      # don't need individual seat numbers, only need to count # of bookings
      discarded_bookings << booking
    end
  end

  def seat_taken?(booking)
    (reserved_seats & booking.requested_seats).count > 0
  end

  def single_seat_left?(booking)
    booking.start_seat.number
  end

  def valid?(booking)
    !seat_taken?(booking)
  end

end