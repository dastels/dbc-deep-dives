class DBCLinkedList
  def initialize
    @head = nil
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
  end

end


class ListNode
  def initialize(value)
    @value = value
    @next = nil
  end

  def append(node)
    if @next.nil?
      @next = node
    else
      @next.append(node)
    end
  end

  def size
    if @next.nil?
      1
    else
      1 + @next.size
    end
  end
end
