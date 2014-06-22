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
    return @storage[index] if put.nil?
    @storage[index] = put
    self
  end

  def insert(item, at: 0)
    @storage.insert(at, item)
    self
  end
  
  def remove_at(index)
    @storage.delete_at(index)
    self
  end


end
