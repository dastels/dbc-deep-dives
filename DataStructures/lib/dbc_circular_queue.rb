require 'empty_exception'
require 'full_exception'

class DbcCircularQueue

  def initialize(size)
    @capacity = size + 1
    @storage = Array.new(@capacity)
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
    raise ::FullException if @front == potential_rear
    @rear = potential_rear
    @storage[@rear] = item
  end

  def dequeue
    raise ::EmptyException if @front == @rear
    @front = advance(@front)
    @storage[@front]
  end

  private

  def advance(i)
    (i + 1) % @capacity
  end

end
