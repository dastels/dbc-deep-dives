class DbcGraph

  def initialize
    @nodes = []
    
  end

  def add(v)
    node = find(v)
    return node unless node.nil?
    new_node = DbcGraphNode.new(v)
    @nodes << new_node
    new_node
  end

  def delete(v)
  end

  def find(v)
    i = @nodes.index {|n| n.value == v}
    return @nodes[i] unless i.nil?
    nil
  end

  def adjacent?(x, y)
  end

  def neighbors(x)
  end

  def connect(x, y)
  end

  def disconnect(x, y)
  end

  def get_node_value(x)
  end

  def set_node_value(x, v)
  end

  def get_edge_value(x, y)
  end

  def set_edge_value(x, y, v)
  end
  
end


class DbcGraphNode
  attr_reader :value
  
  def initialize(v=nil)
    @value = v
    @outgoing = []
  end
  

end


class DbcGraphEdge

  def initilize(source, destination)
    @source = source
    @destination = destination
    @value = nil
  end
  
end
