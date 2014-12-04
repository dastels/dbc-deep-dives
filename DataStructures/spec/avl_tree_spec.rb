require_relative '../lib/dbc_avl_tree.rb'
require 'spec_helper.rb'

describe 'DBCAVLTree' do

  context 'when newly created' do

    before(:each) do
      @tree = DBCAVLTree.new
    end

    it 'renders as empty' do
      expect(@tree.to_s).to eql('[]')
    end

    it 'is empty' do
      expect(@tree).to be_empty
    end

    it 'has zero items' do
      expect(@tree).to have(0)
    end

    it 'has a depth of 0' do
      expect(@tree.depth).to eql 0
    end
    
    it 'should have the first insertion set the root' do
      @tree.insert(10)
      expect(@tree.to_s).to eql('[- 10 -]')
    end
    
  end

  context 'with one value' do
    before(:each) do
      @tree = DBCAVLTree.new
      @tree.insert(10)
    end

    it 'renders appropriately' do
      expect(@tree.to_s).to eql('[- 10 -]')
    end

    it 'is not empty' do
      expect(@tree).to_not be_empty
    end

    it 'has one items' do
      expect(@tree).to have(1)
    end

    it 'has a depth of 1' do
      expect(@tree.depth).to eql 1
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
      @tree = DBCAVLTree.new
      @tree.insert(10)
      @tree.insert(5)
      @tree.insert(15)
      @tree.insert(3)
      @tree.insert(7)
      @tree.insert(11)
      @tree.insert(20)
    end

    it 'has 7 items' do
      expect(@tree).to have(7)
    end

    it 'has a depth of 3' do
      expect(@tree.depth).to eql 3
    end
    
    it 'can find in the root' do
      expect(@tree.find(10)).to eql true
    end

    it 'can find an internal node on the left' do
      expect(@tree.find(5)).to eql true
    end

    it 'can find an internal node on the right' do
      expect(@tree.find(15)).to eql true
    end

    it 'can find a leaf node' do
      expect(@tree.find(7)).to eql true
    end

    it 'cant find a missing node' do
      expect(@tree.find(30)).to eql false
    end

    it 'traverses preorder' do
      a = []
      @tree.preorder {|i| a << i}
      expect(a.join(" ")).to eql "10 5 3 7 15 11 20"
    end

    it 'traverses inorder' do
      a = []
      @tree.inorder {|i| a << i}
      expect(a.join(" ")).to eql "3 5 7 10 11 15 20"
    end

    it 'traverses postorder' do
      a = []
      @tree.postorder {|i| a << i}
      expect(a.join(" ")).to eql "3 7 5 11 20 15 10"
    end

    it "maps" do
      new_tree = @tree.map {|i| i + 1}
      expect(new_tree.to_s).to eql  "[[[- 4 -] 6 [- 8 -]] 11 [[- 12 -] 16 [- 21 -]]]"
    end

  end


  context 'with unbalanced insertion' do

    it "balances" do
      @tree = DBCAVLTree.new
      @tree.insert(12)
      @tree.insert(8)
      @tree.insert(18)
      @tree.insert(17)
      @tree.insert(5)
      @tree.insert(11)
      @tree.insert(4)
      @tree.insert(7)
      @tree.insert(2)

      expect(@tree).to be_balanced
    end

    it "is always balanced" do
      puts
      (1..100).each do |i|
        puts i
        @tree = DBCAVLTree.new
        (1..1000).each do |j|
          r = (rand * 10000).to_i
          @tree.insert(r)
          expect(@tree).to be_balanced
        end
      end
    end
    
  end

end
