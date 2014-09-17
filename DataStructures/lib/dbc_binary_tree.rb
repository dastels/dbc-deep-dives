class DBCBinaryTree

  def initialize
    @root = nil
  end

  def insert(n)
    if @root.nil?
      @root = BinaryTreeNode.new(n)
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

  def to_s
    left_string = @left.nil? ? '[]' : "[#{@left.to_s}]"
    right_string = @right.nil? ? '[]' : "[#{@right.to_s}]"
    "[#{left_string} #{@value} #{right_string}]"
  end
  
end
