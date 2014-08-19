class Booking

  attr_reader :id, :start_row, :start_seat, :finish_row, :finish_seat

  def initialize(id, start_row, start_seat, finish_row=nil, finish_seat=nil)
    @id = id
    @start_row = start_row
    @start_seat = start_seat
    @finish_row = finish_row
    @finish_seat = finish_seat
  end

end