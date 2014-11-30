class DBCBinaryTree

  def initialize(r=nil)
    @root = r
  end


  def empty?
    @root.nil?
  end


  def size
    @root.nil? ? 0 : @root.size
  end

  
  def depth
    @root.nil? ? 0 : @root.depth
  end
  

  def insert(n)
    if @root.nil?
      @root = BinaryTreeNode.new(n)
    else
      @root.insert(n)
    end
  end


  def find(n)
    @root.nil? ? false : @root.find(n)
  end
  

  def to_s
    @root.nil? ? '[]' : @root.to_s
  end


  def preorder &block
      @root.preorder &block unless @root.nil?
  end


  def inorder &block
      @root.inorder &block unless @root.nil?
  end


  def postorder &block
      @root.postorder &block unless @root.nil?
  end

  def map &block
    @root.nil? ? DBCBinaryTree.new : DBCBinaryTree.new(@root.map &block)
  end

end


class BinaryTreeNode

  def initialize(n, l=nil, r=nil)
    @value = n
    @left = l
    @right = r
  end


  def size
    left_size = @left.nil? ? 0 : @left.size
    right_size = @right.nil? ? 0 : @right.size
    left_size + right_size + 1
  end


  def depth
    left_depth = @left.nil? ? 0 : @left.depth
    right_depth = @right.nil? ? 0 : @right.depth
    [left_depth, right_depth].max + 1
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


  def preorder &block
    block.call(@value)
    @left.preorder &block unless @left.nil?
    @right.preorder &block unless @right.nil?
  end

  
  def inorder &block
    @left.inorder &block unless @left.nil?
    block.call(@value)
    @right.inorder &block unless @right.nil?
  end

  
  def postorder &block
    @left.postorder &block unless @left.nil?
    @right.postorder &block unless @right.nil?
    block.call(@value)
  end

  def map &block
    l = @left.nil? ? nil : (@left.map &block)
    r = @right.nil? ? nil : (@right.map &block)
    BinaryTreeNode.new(block.call(@value), l, r)
  end


end
