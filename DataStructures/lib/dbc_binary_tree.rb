class DBCBinaryTree

  def initialize
    @root = nil
  end

  def insert(n)
    if @root.nil?
      @root = BinaryTreeNode.new(n)
    else
      @root.insert(n)
    end
  end


  def find(n)
    if @root.nil?
      false
    else
      @root.find(n)
    end
  end
  

  def to_s
    return '[]' if @root.nil?
    @root.to_s
  end
  

end


class BinaryTreeNode

  def initialize(n)
    @value = n
    @left = nil
    @right = nil
  end


  def insert(n)
    return if n == @value
    if n < @value
      @left = @left.nil? ? BinaryTreeNode.new(n) : @left.insert(n)
    else
      @right = @right.nil? ? BinaryTreeNode.new(n) : @right.insert(n)
    end
    self
  end


  def find(n)
    return true if @value == n
    return @left.find(n) unless @left.nil? || n > @value
    return @right.find(n) unless @right.nil?
    false
  end
  

  def to_s
    left_string = @left.nil? ? '-' : @left.to_s
    right_string = @right.nil? ? '-' : @right.to_s
    "[#{left_string} #{@value} #{right_string}]"
  end
  
end
