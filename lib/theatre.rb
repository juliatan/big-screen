class Theatre

  attr_reader :reserved_seats, :bookings, :reserved_bookings, :discarded_bookings

  def initialize
    @reserved_seats = []
    @bookings = []
    @reserved_bookings = []
    @discarded_bookings = []
  end

  def process(booking)
    bookings << booking
    if valid? booking
      booking.requested_seats.each do |requested_seat|
        reserved_seats << requested_seat
      end
      reserved_bookings << booking
    else
      # don't need individual seat numbers, only need to count # of bookings
      discarded_bookings << booking
    end
  end

  def seat_taken?(booking)
    (reserved_seats & booking.requested_seats).count > 0
  end

  def same_row?(booking1, booking2)
    booking1.start_seat.row == booking2.start_seat.row
  end

  def gap_between_bookings(booking1, booking2)
    if booking1.finish_seat.number < booking2.start_seat.number
      # need to subtract 1 because seat numbers are inclusive
      booking2.start_seat.number - booking1.finish_seat.number - 1
    else
      booking1.start_seat.number - booking2.finish_seat.number - 1
    end
  end

  def gap_of_one?(booking)
    gaps = []

    reserved_bookings.each do |reserved_booking|
      if same_row?(booking, reserved_booking)
        gaps << gap_between_bookings(booking, reserved_booking)
      else
        next
      end
    end

    gaps.include? 1
  end

  def valid_booking_seats?(booking)
    booking.status == 'valid'
  end

  def valid?(booking)
    valid_booking_seats?(booking) &&
    !seat_taken?(booking) &&
    !gap_of_one?(booking)
  end

end