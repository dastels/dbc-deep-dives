class DBCLinkedList
  def initialize
    @head = nil
  end

  def to_a
    if @head.nil?
      []
    else
      @head.to_a
    end

  end

  def empty?
    @head.nil?
  end

  def size
    if @head.nil?
      0
    else
      @head.size
    end
  end

  def append(value)
    new_node = ListNode.new(value)
    if @head.nil?
      @head = new_node
    else
      @head.append(new_node)
    end
    new_node
  end

  def prepend(value)
    @head = ListNode.new(value, @head)
  end

  def find(value)
    if @head.nil?
      nil
    else
      @head.find(value)
    end
  end
end


class ListNode

  def initialize(value, rest=nil)
    @value = value
    @rest = rest
  end

  def to_a
    if @rest.nil?
      [@value]
    else
      @rest.to_a.unshift(@value)
    end
  end

  def append(node)
    if @rest.nil?
      @rest = node
    else
      @rest.append(node)
    end
  end

  def size
    if @rest.nil?
      1
    else
      1 + @rest.size
    end
  end

  def find(value)
    if @value == value
      self
    elsif @rest.nil?
      nil
    else
      @rest.find(value)
    end
  end

end
