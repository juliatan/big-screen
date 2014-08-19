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
    less_than_6_seats? && same_row? && no_single_seat?
  end

  def less_than_6_seats?
    seat_count < MAX_SEATS
  end

  def same_row?
    start_seat.row == finish_seat.row
  end

  def no_single_seat?
    start_seat.number != 1
  end

end