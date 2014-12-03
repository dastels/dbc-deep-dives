class DBCTreap

  def initialize(r=nil)
    @root = r
    @lowest = NilTreapNode.instance
    @highest = NilTreapNode.instance
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
  

  def insert(k, v)
    if @root.nil?
      @root = TreapNode.new(k, v)
      @lowest = @root
      @highest = @root
    else
      @root.insert(k, v)
    end

    a = []
    @root.each {|i| a << i}
    puts a.join(' ')
  end


  def find(k)
    @root.nil? ? false : @root.find(k)
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
    @root.nil? ? DBCTreap.new : DBCTreap.new(@root.map &block)
  end

  def each &block
    @lowest.each &block
  end
  
end


class NilTreapNode

  @@instance = nil
  
  def self.instance
    @@instance = NilTreapNode.new if @@instance.nil?
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

  def next
    @@instance
  end

  def previous
    @@instance
  end

  def next=(n)
  end

  def previous=(p)
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
  
  def insert(k, v)
   [TreapNode.new(k, v), true]
  end

  def left_rotate
    @@instance
  end

  def right_rotate
    @@instance
  end    

  def find(k)
    nil
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

  def each &block
  end

end


class TreapNode

  attr_reader :key, :value, :left, :right
  attr_accessor :next, :previous

  def initialize(k, v, l=NilTreapNode.instance, r=NilTreapNode.instance, n=NilTreapNode.instance, p=NilTreapNode.instance)
    @key = k
    @value = v
    @left = l
    @right = r
    @next = n
    @previous = p
  end


  def size
    @left.size + @right.size + 1
  end


  def depth
    [@left.depth, @right.depth].max + 1
  end


  def insert(k, v)
    return [nil, false] if k == @key

    if k < @key
      l, direct = @left.insert(k, v)
      return [nil, false] if l.nil?
      @left = l
      if direct
        @left.next = self
        @previous = @left
      end
    else
      r, direct = @right.insert(k, v)
      return [nil, false] if r.nil?
      @right = r
      if direct
        @right.previous = self
        @next = @right
      end
    end

    balance = @left.depth - @right.depth

    if balance > 1 && k < @left.key
     return [right_rotate, false]
    end
 
    if balance < -1 && k > @right.key
      return [left_rotate, false]
    end
        
    if balance > 1 && k > @left.key
      @left = @left.left_rotate
      return [right_rotate, false]
    end
 
    if balance < -1 && k < @right.key
      @right = @right.right_rotate
      return [left_rotate, false]
    end
 
    [self, false]
  end


  def left_rotate
    TreapNode.new(@right.key, @right.value, TreapNode.new(@key, @value, @left, @right.left, @next, @previous), @right.right, @right.next, @right.previous)
  end


  def right_rotate
    TreapNode.new(@left.key, @left.value, @left.left, TreapNode.new(@key, @value, @left.right, @right, @next, @previous), @left.next, @left.previous)
  end    


  def find(k)
    return @value if @key == k
    return @left.find(k) unless k > @key
    return @right.find(k)
  end
  

  def to_s
    "[#{@left} (#{@key} #{@value}) #{@right}]"
  end


  def preorder &block
    block.call(@key, @value)
    @left.preorder &block
    @right.preorder &block
  end

  
  def inorder &block
    @left.inorder &block
    block.call(@key, @value)
    @right.inorder &block
  end

  
  def postorder &block
    @left.postorder &block
    @right.postorder &block
    block.call(@key, @value)
  end

  def map &block
    TreapNode.new(@key, block.call(@value), (@left.map &block), (@right.map &block))
  end

  def each &block
    block.call(@value)
    @next.each(&block)
  end


end
