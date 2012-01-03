class Seat < ActiveRecord::Base
  belongs_to :flight
  validate :baggage_check, :capacity_check
 
  private
  def baggage_check
    if baggage > flight.baggage_allowance
      errors.add(:baggage, " weight is over")
    end
  end
  def capacity_check
    if flight.seats.size >= flight.capacity
      errors.add("","The flight is fully booked")
    end
  end
end