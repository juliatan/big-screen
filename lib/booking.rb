class Booking

  attr_reader :start_seat, :finish_seat

  def initialize(start_seat, finish_seat=start_seat)
    @start_seat = start_seat
    @finish_seat = finish_seat
  end

  def seat_count
    finish_seat.number - start_seat.number + 1
  end

end