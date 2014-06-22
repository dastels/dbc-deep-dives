class DbcStack

  def initialize
    @storage = []
  end

  def empty?
    @storage.empty?
  end

  def push(value)
    @storage << value
  end

  def pop
    @storage.delete_at(-1)
  end

  def peek
    @storage[-1]
  end
  
end
