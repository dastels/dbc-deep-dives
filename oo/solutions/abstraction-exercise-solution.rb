class  Node
  def initialize
    @labels = []
  end

  def add_label(a_string)
    @labels << a_string
    a_string
  end

  def with_each_label &block
    @labels.each {|l| block.call(l)}
  end
  
end


n = Node.new
n.add_label("movie")
n.add_label("action")
n.add_label("FEATURE")
n.with_each_label {|l| puts l.capitalize}
n.with_each_label {|l| puts l.downcase}
n.with_each_label {|l| puts l.upcase}
