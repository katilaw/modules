module Container
  def contents
    @contents ||= []
  end

  def allowed
    @allowed ||= [Object]
  end

  def full?
    return contents.size >= @capacity
  end

  def empty?
    return contents.size <= 0
  end

  def add(item)

    if !allowed.include?(item.class)
      raise ContainerError.new("Objects of type #{item.class} are not allowed in container with allowed: #{allowed}")
    end

    if contents.include?(item)
      raise ContainerError.new("Cannot add an object that has already been added.")
    end

    if full?
      raise ContainerError.new("Cannot add an object to a full container.")
    end

    contents.push(item)
  end

  def remove(item)
    if !contents.include?(item)
      raise ContainerError.new("Cannot remove an object that is not currently contained")
    end

    contents.delete(item)
  end

end

class ContainerError < StandardError

  attr_reader :message

  def initialize(message)
    @message = message
  end
end
