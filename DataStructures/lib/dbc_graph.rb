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
    i = find_node_helper(v)
    @nodes.delete_at(i) unless i.nil?
  end

  def find(v)
    i = find_node_helper(v)
    return @nodes[i] unless i.nil?
    nil
  end

  #  tests whether there is an edge from node x to node y.
  def adjacent?(x, y)
    x.connected_to?(y)
  end

  # lists all nodes y such that there is an edge from x to y.
  def neighbors(x)
    x.neighbors
  end

  # adds the edge from x to y, if it is not there.
  def connect(x, y)
    x.connect_to(y)
  end

  # removes the edge from x to y, if it is there.
  def disconnect(x, y)
    x.disconnect_from(y)
  end

  # returns the value associated with the node x.
  def get_node_value(x)
    x.value
  end

  # sets the value associated with the node x to a.
  def set_node_value(x, v)
    x.value = v
  end

  # returns the value associated to the edge (x,y).
  def get_edge_value(x, y)
    e = x.connection_to(y)
    e.nil? ? nil : e.value
  end

  # sets the value associated to the edge (x,y) to v.
  def set_edge_value(x, y, v)
    e = x.connection_to(y)
    e.value = v unless e.nil?
  end

  private

  def find_node_helper(v)
    @nodes.index {|n| n.value == v}
  end
  

  class DbcGraphNode

    attr_accessor :value
    
    def initialize(v=nil)
      @value = v
      @outgoing = []
    end
    
    def connect_to(a_node)
      unless connected_to?(a_node)
        e = DbcGraphEdge.new(self, a_node)
        @outgoing << e
        e
      end
    end
    
    def disconnect_from(a_node)
      i = @outgoing.index {|e| e.goes_to?(a_node)}
      @outgoing.delete_at(i) unless i.nil?
    end
    
    def connected_to?(a_node)
      i = connection_to(a_node)
      !i.nil?
    end
    
    def neighbors
      @outgoing.map {|e| e.goes_where}
    end

    def connection_to(a_node)
      i = @outgoing.index {|e| e.goes_to?(a_node)}
      i.nil? ? nil : @outgoing[i]
    end
  end
  
  
  class DbcGraphEdge

    attr_accessor :value
    
    def initialize(source, destination, value=nil)
      @source = source
      @destination = destination
      @value = value
    end
    
    def goes_to?(a_node)
      @destination == a_node
    end
    
    def goes_where
      @destination
    end

  end
end
