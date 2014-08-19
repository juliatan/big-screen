class Theatre

  attr_reader :reserve_list

  def initialize
    @reserve_list = []
  end

  def authorise(booking)
    booking.requested_seats.each do |requested_seat|
      reserve_list << requested_seat
    end
  end

end