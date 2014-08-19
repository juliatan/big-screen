class Booking

  attr_reader :id, :start_row

  def initialize(id, start_row)
    @id = id
    @start_row = start_row
  end

end