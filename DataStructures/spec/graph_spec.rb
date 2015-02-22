require_relative '../lib/dbc_graph.rb'
require 'spec_helper.rb'

describe 'A DbcGraph' do

  before(:each) do
    @graph = DbcGraph.new
  end

  context 'when empty' do
    it 'cant find nodes' do
      expect(@graph.find("Dave")).to be_nil
    end

    it 'can add a node, which can then be found' do
      n = @graph.add("Dave")
      expect(n).to_not be_nil
      expect(@graph.find("Dave")).to_not be_nil
      expect(@graph.find("Dave")).to eq n
    end
  end

  context 'with a node' do
    before(:each) do
      @dave = @graph.add("Dave")
    end
    
    it 'can delete a node' do
      @graph.delete("Dave")
      expect(@graph.find("Dave")).to be_nil # prove it's not there
    end

    it 'can fetch the value of a node' do
      expect(@graph.get_node_value(@dave)).to eq "Dave"
    end
    
    it 'can change the value of a node' do
      @graph.set_node_value(@dave, "David")
      expect(@graph.get_node_value(@dave)).to eq "David"
      expect(@graph.find("Dave")).to be_nil
      expect(@graph.find("David")).to eq @dave
    end

  end

  context 'with two unconnected nodes' do
    before(:each) do
      @dave = @graph.add("Dave")
      @apple = @graph.add("Apple")
    end

    it 'knows they are not adjacent' do
      expect(@graph.adjacent?(@dave, @apple)).to eq false
    end

    it 'knows that neither have neighbors' do
      expect(@graph.neighbors(@dave)).to be_empty
      expect(@graph.neighbors(@apple)).to be_empty
    end

    it 'can connect nodes' do
      @graph.connect(@dave, @apple)
      expect(@graph.adjacent?(@dave, @apple)).to eq true
    end

    it 'supports unlabeled connections' do
      @edge = @graph.connect(@dave, @apple)      
      expect(@graph.get_edge_value(@dave, @apple)).to be_nil
    end

    it 'supports changing the label of connections' do
      @edge = @graph.connect(@dave, @apple)
      @graph.set_edge_value(@dave, @apple, "buys")
      expect(@graph.get_edge_value(@dave, @apple)).to eq "buys"
    end

  end

  context 'with two connected nodes' do
    before(:each) do
      @dave = @graph.add("Dave")
      @apple = @graph.add("Apple")
      @edge = @graph.connect(@dave, @apple)
    end

    it 'knows adjacency is directed' do
      expect(@graph.adjacent?(@dave, @apple)).to eq true
      expect(@graph.adjacent?(@apple, @dave)).to eq false
    end

    it 'knows neighborship is directed' do
      expect(@graph.neighbors(@dave)).to eq [@apple]
      expect(@graph.neighbors(@apple)).to be_empty
    end

    it 'can disconnect nodes' do
      @graph.disconnect(@dave, @apple)
      expect(@graph.adjacent?(@dave, @apple)).to eq false
    end
  end


  
end


# BONUS
#
# 1. Add support for proving edge labels to all related calls: connect, disconnect
# adjacent?
#
# 2. Change neighbors to return an array of pairs (connected-node,
# edge-label). That tells us not only what is connected, but how.
#
# 3. Add a path?(x, y) method that returns whether a path exists from
# x to y
#
# 4. Add a path(x, y) method that returns an array of the edge labels
# and node values for a path from x to y:
#  [x, e1, n1, e2, n2 ... em, y]
#
# 5. Make a graph with nodes of people and movies.
#    Connect the nodes with the following relationships:
#      person --friend_of--> person
#      person --likes--> movie
#      person --dislikes--> movie
#
#   Write code to start with a person node i.e. "you", and find movies
#   to watch: movies that at least half of your friends like and less
#   than quarter of them dislike.
