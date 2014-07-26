require 'empty_exception'

class DbcArray

  def initialize
    @storage = []
  end

  def empty?
    size == 0
  end
  
  def size
    @storage.size
  end
  
  def to_s
    @storage.to_s
  end

  def to_a
    @storage.dup
  end
  
  def append(item)
    @storage << item
    self
  end

  def at(index, put: nil)
    empty_check(index)
    return @storage[index] if put.nil?
    @storage[index] = put
    self
  end

  def insert(item, at: 0)
    raise ::EmptyException if at > 0 && at >= size
    @storage.insert(at, item)
    self
  end
  
  def remove_at(index)
    empty_check(index)
    @storage.delete_at(index)
    self
  end

  def empty_check(index)
    raise ::EmptyException if index >= size
  end


end
