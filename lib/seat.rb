class Seat

  attr_reader :row, :number, :status

  def initialize(row, number)
    @row = row
    @number = number
    @status = 'unbooked'
  end

end