class DbcQueue

  def initialize
    @storage = []
  end

  def empty?
    @storage.empty?
  end

  def enqueue(value)
    @storage << value
  end

  def dequeue
    @storage.delete_at(0)
  end


end
