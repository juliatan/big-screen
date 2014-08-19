class Booking

  attr_reader :start_seat, :finish_seat
  MAX_SEATS = 6

  def initialize(start_seat, finish_seat=start_seat)
    @start_seat = start_seat
    @finish_seat = finish_seat
    raise 'Invalid booking request' unless valid?
  end

  def seat_count
    finish_seat.number - start_seat.number + 1
  end

  def valid?
    seat_count < MAX_SEATS
  end

end