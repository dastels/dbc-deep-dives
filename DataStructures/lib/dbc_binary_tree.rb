class DBCBinaryTree

  def initialize(r=NilTreeNode.instance)
    @root = r
  end


  def empty?
    @root.nil?
  end


  def size
    @root.size
  end

  
  def depth
    @root.depth
  end
  

  def insert(n)
    @root = @root.insert(n)
  end


  def find(n)
    @root.find(n)
  end
  

  def to_s
    @root.nil? ? '[]' : @root.to_s
  end


  def preorder &block
      @root.preorder &block
  end


  def inorder &block
      @root.inorder &block
  end


  def postorder &block
      @root.postorder &block
  end

  def map &block
    DBCBinaryTree.new(@root.map &block)
  end

end


class NilTreeNode

  @@instance = nil
  
  def self.instance
    @@instance = NilTreeNode.new if @@instance.nil?
    @@instance
  end

  def nil?
    true
  end

  def value
    0
  end

  def left
    @@instance
  end

  def right
    @@instance
  end

  def size
    0
  end

  def depth
    0
  end

  def compute_balance
    0
  end
  
  def insert(n)
   BinaryTreeNode.new(n)
  end

  def left_rotate
    @@instance
  end

  def right_rotate
    @@instance
  end    

  def find(n)
    false
  end
 
  def to_s
    "-"
  end

  def preorder &block
  end

  def inorder &block
  end

  def postorder &block
  end

  def map &block
    @@instance
  end
end


class BinaryTreeNode

  def initialize(n, l=NilTreeNode.instance, r=NilTreeNode.instance)
    @value = n
    @left = l
    @right = r
  end


  def size
    @left.size + @right.size + 1
  end


  def depth
    [@left.depth, @right.depth].max + 1
  end

  
  def insert(n)
    return if n == @value
    if n < @value
      @left = @left.insert(n)
    else
      @right = @right.insert(n)
    end
    self
  end


  def find(n)
    return true if @value == n
    return @left.find(n) unless n > @value
    return @right.find(n)
  end
  

  def to_s
    "[#{@left} #{@value} #{@right}]"
  end


  def preorder &block
    block.call(@value)
    @left.preorder &block
    @right.preorder &block
  end

  
  def inorder &block
    @left.inorder &block
    block.call(@value)
    @right.inorder &block
  end

  
  def postorder &block
    @left.postorder &block
    @right.postorder &block
    block.call(@value)
  end

  def map &block
    BinaryTreeNode.new(block.call(@value), (@left.map &block), (@right.map &block))
  end


end
