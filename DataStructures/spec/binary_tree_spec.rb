require_relative '../lib/dbc_binary_tree.rb'
require 'spec_helper.rb'

describe 'DBCBinaryTree' do

  context 'when newly created' do

    before(:each) do
      @tree = DBCBinaryTree.new
    end

    it 'should render empty' do
      expect(@tree.to_s).to eql('[]')
    end
    
    it 'should have the first insertion set the root' do
      @tree.insert(10)
      expect(@tree.to_s).to eql('[[] 10 []]')
    end
    
  end

  context 'with one value' do
    before(:each) do
      @tree = DBCBinaryTree.new
      @tree.insert(10)
    end

    it 'should add 
  end

end
