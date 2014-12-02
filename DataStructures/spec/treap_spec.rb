require_relative '../lib/dbc_treap.rb'
require 'spec_helper.rb'

describe 'DBCTreap' do

  context 'when newly created' do

    before(:each) do
      @tree = DBCTreap.new
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
      @tree.insert(10, 'a')
      expect(@tree.to_s).to eql('[- (10 a) -]')
    end
    
  end

  context 'with one value' do
    before(:each) do
      @tree = DBCTreap.new
      @tree.insert(10, 'a')
    end

    it 'renders appropriately' do
      expect(@tree.to_s).to eql('[- (10 a) -]')
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
      @tree.insert(5, "b")
      expect(@tree.to_s).to eql('[[- (5 b) -] (10 a) -]')
    end
    
    it 'can add a number on the right' do
      @tree.insert(15, "c")
      expect(@tree.to_s).to eql('[- (10 a) [- (15 c) -]]')
    end

    it 'can insert several numbers' do
      @tree.insert(5, 'b')
      @tree.insert(15, 'c')
      @tree.insert(7, 'd')
      @tree.insert(11, 'e')
      expect(@tree.to_s).to eql('[[- (5 b) [- (7 d) -]] (10 a) [[- (11 e) -] (15 c) -]]')
    end
    
  end

  context 'with several values' do
    before(:each) do
      @tree = DBCTreap.new
      @tree.insert(10, 'a')
      @tree.insert(5, 'b')
      @tree.insert(15, 'c')
      @tree.insert(3, 'd')
      @tree.insert(7, 'e')
      @tree.insert(11, 'f')
      @tree.insert(20, 'g')
    end

    it 'has 7 items' do
      expect(@tree).to have(7)
    end

    it 'has a depth of 3' do
      expect(@tree.depth).to eql 3
    end
    
    it 'can find in the root' do
      expect(@tree.find(10)).to eql "a"
    end

    it 'can find an internal node on the left' do
      expect(@tree.find(5)).to eql "b"
    end

    it 'can find an internal node on the right' do
      expect(@tree.find(15)).to eql "c"
    end

    it 'can find a leaf node' do
      expect(@tree.find(7)).to eql "e"
    end

    it 'cant find a missing node' do
      expect(@tree.find(30)).to eql nil 
    end

    it 'traverses preorder' do
      a = []
      @tree.preorder {|k, i| a << i}
      expect(a.join(" ")).to eql "a b d e c f g"
    end

    it 'traverses inorder' do
      a = []
      @tree.inorder {|k, i| a << i}
      expect(a.join(" ")).to eql "d b e a f c g"
    end

    it 'traverses postorder' do
      a = []
      @tree.postorder {|k, i| a << i}
      expect(a.join(" ")).to eql "d e b f g c a"
    end

    it "maps" do
      new_tree = @tree.map {|i| i.upcase}
      expect(new_tree.to_s).to eql  "[[[- (3 D) -] (5 B) [- (7 E) -]] (10 A) [[- (11 F) -] (15 C) [- (20 G) -]]]"
    end

    it "enumerates" do
      a = []
      @tree.each {|i| a << i}
      expect(a.join(" ")).to eql "d b e a f c g"
    end

    it "enumerates faster" do
    end
    
  end




end
