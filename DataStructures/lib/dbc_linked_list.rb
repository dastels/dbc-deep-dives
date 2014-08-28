class DBCLinkedList

  attr_reader :head
  
  def initialize(head = nil)
    @head = head
  end

  
  def empty?
    @head.nil?
  end

  
  def prepend(value)
    @head = ListNode.new(value, @head)
  end

  
  def append(value)
    if @head.nil?
      @head = ListNode.new(value)
    else
      @head.append(value)
    end
  end

  
  def size
    if @head.nil?
      0
    else
      @head.size
    end
  end

  
  def to_a
    if @head.nil?
      []
    else
      @head.to_a
    end
  end

  
  def find(value = nil, &block)
    if @head.nil?
      nil
    else
      if value
        @head.find(value)
      else
        @head.find_with_predicate(&block)
      end
    end
  end

  
  def insert_after(value, node)
    node.insert_after(value)
  end

  
  def delete(node)
    if @head.nil?
      nil
    elsif @head == node
      @head = node.rest
    else
      @head.delete(node)
    end
  end

  
  def map(&block)
    if @head.nil?
      DBCLinkedList.new
    else
      DBCLinkedList.new(@head.map &block)
    end
  end

  
  def map_with(list, &block)
    if @head.nil?
      DBCLinkedList.new
    else
      DBCLinkedList.new(@head.map_with(list.head, &block))
    end
  end

  
  def reduce(initial, &block)
    if @head.nil?
      nil
    else
      @head.reduce(initial, &block)
    end
  end

  
  def insert(value)
    if @head.nil? || value < @head.value
      @head = ListNode.new(value, @head)
    else
      @head.insert(value)
    end
  end
  
end


#--------------------------------------------------------------------------------


class ListNode

  attr_accessor :rest
  attr_reader :value

  
  def initialize(value, rest=nil)
    @value = value
    @rest = rest
  end

  
  def size
    if @rest.nil?
      1
    else
      @rest.size + 1
    end
  end

  
  def append(value)
    if @rest.nil?
      @rest = ListNode.new(value)
    else
      @rest.append(value)
    end
  end

  
  def to_a
    if @rest.nil?
      [@value]
    else
      @rest.to_a.unshift(@value)
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

  
  def find_with_predicate(&block)
    if block.call(@value)
      self
    elsif @rest.nil?
      nil
    else
      @rest.find_with_predicate(&block)
    end
  end

  
  def insert_after(value)
    @rest = ListNode.new(value, @rest)
  end

  def delete(node)
    if @rest == node
      @rest = node.rest
    elsif @rest.nil?
      nil
    else
      @rest.delete(node)
    end
  end

  
  def map(&block)
    rest = @rest.nil? ? nil : @rest.map(&block)
    ListNode.new(block.call(@value), rest)
  end

  
  def map_with(node, &block)
    new_rest = (@rest.nil? || node.rest.nil?) ? nil : @rest.map_with(node.rest, &block)
    ListNode.new(block.call(@value, node.value), new_rest)
  end

  
  def reduce(acc, &block)
    new_acc = block.call(acc, @value)
    if @rest.nil?
      new_acc
    else
      @rest.reduce(new_acc, &block)
    end
  end

  
  def insert(value)
    if @rest.nil?
      @rest = ListNode.new(value)
    elsif value < @rest.value
      @rest = ListNode.new(value, @rest)
    else
      @rest.insert(value)
    end
  end
  
end
