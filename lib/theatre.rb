class Theatre

  attr_reader :reserved_seats, :reserved_bookings, :discarded_bookings,
              :first_seats_reserved, :last_seats_reserved

  def initialize
    @reserved_seats = []
    @reserved_bookings = []
    @discarded_bookings = []
    @first_seats_reserved = []
    @last_seats_reserved = []
  end

  def process(booking)
    if valid? booking
      booking.requested_seats.each do |requested_seat|
        reserved_seats << requested_seat
      end
      reserved_bookings << booking
      first_seats_reserved << booking.start_seat
      last_seats_reserved << booking.finish_seat
    else
      # don't need individual seat numbers, only need to count # of bookings
      discarded_bookings << booking
    end
  end

  def seat_taken?(booking)
    (reserved_seats & booking.requested_seats).count > 0
  end

  # def reservation_in_existing_row?(booking)
  #   @reserved_bookings.any? do |reserved_booking|
  #     reserved_booking.start_seat.row == booking.start_seat.row
  #   end
  # end

  # def last_seats_reserved_in_row(booking)
  #   last_seats_reserved.keep_if do |seat|
  #     # to replace seat[0] with regex
  #     seat[0] == booking.start_seat.row.to_s
  #   end
  #   last_seats_reserved
  # end

  # def single_seat_left?(booking)
  #   if reservation_in_existing_row?(booking)
  #     last_seats_reserved_in_row.each do |seat|
  #       booking.first_seat.number - seat.scan(/:(.+)/).flatten[0].to_i == 2
  #     end
  #   else
  #     false
  #   end

  # end

  def valid?(booking)
    !seat_taken?(booking)
  end

end