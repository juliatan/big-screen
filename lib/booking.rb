class Booking

  attr_reader :start_seat, :finish_seat

  def initialize(start_seat, finish_seat)
    @start_seat = start_seat
    @finish_seat = finish_seat
  end

end