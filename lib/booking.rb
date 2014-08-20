class Booking

  attr_reader :start_seat, :finish_seat, :status

  MAX_SEATS_PER_BOOKING = 6
  ZERO_INDEXED = 1
  NO_OF_SEATS_IN_ROW = 50

  def initialize(start_seat, finish_seat=start_seat)
    @start_seat = start_seat
    @finish_seat = finish_seat

    if valid?
      add_to_requested_seats
      @status = 'valid'
    else
      @status = 'invalid'
    end
  end

  def valid?
    less_than_6_seats? && same_row?
  end

  def invalid!
    @status = 'invalid'
  end

  def seat_count
    finish_seat.number - start_seat.number + 1
  end

  def less_than_6_seats?
    seat_count < MAX_SEATS_PER_BOOKING
  end

  def same_row?
    start_seat.row == finish_seat.row
  end

  def previous_seat
    if start_seat.number == 0
      "N/A"
    else
      start_seat.row.to_s + ':' + (start_seat.number - 1).to_s
    end
  end

  def next_seat
    if finish_seat.number == 49
      "N/A"
    else
      finish_seat.row.to_s + ':' + (finish_seat.number + 1).to_s
    end
  end

  def adjacent_seats
    [previous_seat, next_seat]
  end

  def one_seat_from_aisle?
    ( start_seat.number == 1 || finish_seat.number == 48 ) ? true : false
  end

  def requested_seats
    @requested_seats ||= []
  end

  def add_to_requested_seats
    (start_seat.number).upto(finish_seat.number).each do |n|
      requested_seats << start_seat.row.to_s + ":" + n.to_s
    end
  end

end