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

  def insert_after(value, node)
    n = ListNode.new(value)
    n.insert_after(node)
  end

  def delete(node)
    if @head.nil?
      return
    elsif @head == node
      @head = node.rest
    else
      previous = @head.before(node)
      previous.rest = node.rest
    end
  end

  def map(&block)
    if @head.nil?
      nil
    else
      @head.map &block
    end
  end

  def reduce(initial, &block)
    if @head.nil?
      initial
    else
      @head.reduce(initial, &block)
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

  def insert_after(node)
    @rest = node.rest
    node.rest = self
  end

  def before(node)
    if @rest == node
      self
    else
      @rest.before(node)
    end
  end

  def map(&block)
    new_value = block.call(@value)
    if @rest.nil?
      ListNode.new(new_value)
    else
      ListNode.new(new_value, @rest.map(&block))
    end
  end

  def reduce(acc, &block)
    new_acc = block.call(acc, @value)
    if @rest.nil?
      new_acc
    else
      @rest.reduce(new_acc, &block)
    end
  end

  def rest
    @rest
  end

  def rest=(n)
    @rest = n
  end

end
