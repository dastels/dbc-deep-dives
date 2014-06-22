class DbcCircularQueue

  def initialize(size)
    @capacity = size
    @storage = Array.new(size)
    @front = 0
    @rear = 0
  end

  def empty?
    @rear == @front
  end

  def full?
    advance(@rear) == @front
  end

  def to_s
    i = @front
    vals = []
    while i != @rear
      i = advance(i)
      vals << @storage[i]
    end
    "<#{vals.join(', ')}>"
  end
  
  def enqueue(item)
    potential_rear = advance(@rear)
    throw :full if @front == potential_rear
    @rear = potential_rear
    @storage[@rear] = item
  end

  def dequeue
    throw :empty if @front == @rear
    @front = advance(@front)
    @storage[@front]
  end

  private

  def advance(i)
    (i + 1) % @capacity
  end

end
