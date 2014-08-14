class DbcDoubleEndedQueue

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
    succ(@rear) == @front
  end

  def to_s
    i = @front
    vals = []
    while i != @rear
      i = succ(i)
      vals << @storage[i]
    end
    "<#{vals.join(', ')}>"
  end
  
  def enqueue_rear(item)
    potential_rear = succ(@rear)
    throw :full if @front == potential_rear
    @rear = potential_rear
    @storage[@rear] = item
  end

  def enqueue_front(item)
    potential_front = prec(@front)
    throw :full if @rear == potential_front
    @storage[@front] = item
    @front = potential_front
  end

  def dequeue_front
    throw :empty if @front == @rear
    @front = succ(@front)
    @storage[@front]
  end

  def dequeue_rear
    throw :empty if @front == @rear
    temp = @storage[@rear]
    @rear = prec(@rear)
    temp
  end

  private

  def succ(i)
    (i + 1) % @capacity
  end

  def prec(i)
    (i - 1) % @capacity
  end

end
