class DBCAVLTree

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
      @root = AVLTreeNode.new(n)
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
    @root.nil? ? DBCAVLTree.new : DBCAVLTree.new(@root.map &block)
  end

end


class NilAvlTreeNode

  @@instance = nil
  
  def self.instance
    @@instance = NilAvlTreeNode.new if @@instance.nil?
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
   AVLTreeNode.new(n)
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


class AVLTreeNode

  attr_reader :value, :left, :right

  def initialize(n, l=NilAvlTreeNode.instance, r=NilAvlTreeNode.instance)
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

    balance = @left.depth - @right.depth

    if balance > 1 && n < @left.value 
     return right_rotate
    end
 
    if balance < -1 && n > @right.value
      return left_rotate
    end
        
    if balance > 1 && n > @left.value
      @left = @left.left_rotate
      return right_rotate
    end
 
    if balance < -1 && n < @right.value
      @right = @right.right_rotate
      return left_rotate
    end
 
    self
  end


  def left_rotate
    AVLTreeNode.new(@right.value, AVLTreeNode.new(@value, @left, @right.left), @right.right)
  end


  def right_rotate
    AVLTreeNode.new(@left.value, @left.left, AVLTreeNode.new(@value, @left.right, @right))
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
    AVLTreeNode.new(block.call(@value), (@left.map &block), (@right.map &block))
  end


end
