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

end
