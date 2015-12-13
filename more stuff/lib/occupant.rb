class Occupant

  attr_reader :first_name, :last_name

  def initialize(first, last)
    @first_name = first
    @last_name = last
  end

  def == other
    if !(other.is_a? Occupant)
      return false
    end
    return other.first_name == self.first_name && other.last_name == self.last_name
  end
end
