class Booking

  attr_reader :id, :start_row, :start_seat

  def initialize(id, start_row, start_seat)
    @id = id
    @start_row = start_row
    @start_seat = start_seat
  end

end