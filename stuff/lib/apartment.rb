require_relative 'dwelling'
require 'pry'

class Apartment < Dwelling

  attr_accessor :rent, :start_date, :end_date, :capacity

  attr_reader :occupants

  def initialize(address, city, zip)

    @rent = 0
    @start_date = ""
    @end_date = ""
    @capacity = 5
    @occupants = []

    super(address, city, zip)
  end

  def full?
    return @occupants.size >= @capacity
  end



  def add_occupant(occupant)
    if @occupants.include?(occupant)
      raise ChangeOccupantError.new("That person already lives here")
    end

    if full?
      raise FullApartmentError.new
    end

    @occupants.push(occupant)

  end

  def remove_occupant(occupant)
    if !(@occupants.include?(occupant))
      raise ChangeOccupantError.new("That person doesn't live here")
    end

    @occupants.delete occupant
    return occupant
  end

end

class ChangeOccupantError < StandardError
  attr_reader :message
  def initialize(message = "Lol that didn't work")
    @message = message
  end
end

class FullApartmentError < StandardError
end
