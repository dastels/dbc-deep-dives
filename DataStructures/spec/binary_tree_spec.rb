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
      expect(@tree.to_s).to eql('[- 10 -]')
    end
    
  end

  context 'with one value' do
    before(:each) do
      @tree = DBCBinaryTree.new
      @tree.insert(10)
    end

    it 'can add a number on the left' do
      @tree.insert(5)
      expect(@tree.to_s).to eql('[[- 5 -] 10 -]')
    end
    
    it 'can add a number on the right' do
      @tree.insert(15)
      expect(@tree.to_s).to eql('[- 10 [- 15 -]]')
    end

    it 'can insert several numbers' do
      @tree.insert(5)
      @tree.insert(15)
      @tree.insert(7)
      @tree.insert(11)
      expect(@tree.to_s).to eql('[[- 5 [- 7 -]] 10 [[- 11 -] 15 -]]')
    end
    
  end

  context 'with several values' do
    before(:each) do
      @tree = DBCBinaryTree.new
      @tree.insert(10)
      @tree.insert(5)
      @tree.insert(15)
      @tree.insert(7)
      @tree.insert(11)
    end

    it 'can find in the root' do
      expect(@tree.find(10)).to eql true
    end

  end


end
