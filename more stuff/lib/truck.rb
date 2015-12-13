require_relative 'container'
require_relative 'occupant'
require_relative 'box'

class Truck
  include Container

  attr_reader :capacity

  def initialize(capacity)
    @capacity = capacity
    @allowed = [Box]
  end

  def remove_all(occupant)
    stuff = []
    contents.each do |box|
      if box.owner == occupant
        stuff.push box
      end
    end

    return stuff
  end
end
