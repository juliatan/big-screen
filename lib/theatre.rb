class Theatre

  attr_reader :reserve_list, :discarded_bookings

  def initialize
    @reserve_list = []
    @discarded_bookings = []
  end

  def process(booking)
    if valid? booking
      booking.requested_seats.each do |requested_seat|
        reserve_list << requested_seat
      end
    else
      # don't need individual seat numbers, only need to count # of bookings
      discarded_bookings << booking
    end
  end

  def seat_taken?(booking)
    (reserve_list & booking.requested_seats).count > 0
  end

  def valid?(booking)
    !seat_taken?(booking)
  end

end