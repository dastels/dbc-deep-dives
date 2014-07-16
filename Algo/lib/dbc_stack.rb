require 'empty_exception'

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
    empty_check
    @storage.delete_at(-1)
  end

  def peek
    empty_check
    @storage[-1]
  end

  def empty_check
    raise ::EmptyException if empty?
  end

end
