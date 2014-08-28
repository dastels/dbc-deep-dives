require_relative '../lib/dbc_linked_list.rb'
require 'spec_helper.rb'


# map
#reduce

describe "DBCLinkedList" do
   before(:each) do
     @l = DBCLinkedList.new
   end

  context "when fresh" do
    it "is empty" do
      expect(@l).to be_empty
    end
    it "has size of 0" do
      expect(@l).to have 0
    end
    it "converts to an empty array" do
      expect(@l.to_a).to eql []
    end
  end

  context "with one thing in it" do
    before(:each) do
      @l.append("Rob")
    end

    it "is not empty" do
      expect(@l).to_not be_empty
    end

    it "has a size of 1" do
      expect(@l).to have 1
    end

    it "converts to a single element array" do
      expect(@l.to_a).to eql ["Rob"]
    end
  end

  context "with several things in it" do
    before(:each) do
      @item1 = @l.append("Rob")
      @item2 = @l.append("Dave")
      @item3 = @l.append("Mike")
    end

    it "is not empty" do
      expect(@l).to_not be_empty
    end

    it "has a size of 3" do
      expect(@l).to have 3
    end

    it "converts to a 3 element array" do
      expect(@l.to_a).to eql ["Rob", "Dave", "Mike"]
    end

    it "can search for something not in the list" do
      expect(@l.find("Joe")).to be_nil
    end

    it "can find something" do
      expect(@l.find("Dave")).to eql @item2
    end

    it "can prepend" do
      @l.prepend("Marek")
      expect(@l.to_a).to eql ["Marek", "Rob", "Dave", "Mike"]
    end

    it "can insert inside" do
      node = @l.find("Dave")
      @l.insert_after("Kevin", node)
      expect(@l.to_a).to eql ["Rob", "Dave", "Kevin", "Mike"]
    end

    it "can insert at end (appending)" do
      node = @l.find("Mike")
      @l.insert_after("Kevin", node)
      expect(@l.to_a).to eql ["Rob", "Dave", "Mike", "Kevin"]
    end

    it "can delete inside" do
      node = @l.find("Dave")
      @l.delete(node)
      expect(@l.to_a).to eql ["Rob", "Mike"]
    end

    it "can delete first" do
      node = @l.find("Rob")
      @l.delete(node)
      expect(@l.to_a).to eql ["Dave", "Mike"]
    end

    it "can delete last" do
      node = @l.find("Mike")
      @l.delete(node)
      expect(@l.to_a).to eql ["Rob", "Dave"]
    end

    it "can map" do
      expect((@l.map {|v| v.upcase}).to_a).to eql ["ROB", "DAVE", "MIKE"]
    end

    it "can reduce" do
      expect(@l.reduce("") {|acc, v| acc << v }).to eql "RobDaveMike"
    end
    
  end


  context "with numbers" do

    before(:each) do
      @l.append(1)
      @l.append(2)
      @l.append(3)
      @l.append(4)
    end

    it "can map" do
      expect((@l.map {|v| v * v}).to_a).to eql [1, 4, 9, 16]
    end

    it "can do an add reduction" do
      expect(@l.reduce(0) {|acc, v| acc + v}).to eql 10
    end
    
    it "can do an product reduction" do
      expect(@l.reduce(1) {|acc, v| acc * v}).to eql 24
    end
    
  end


  context "can insert in order (bonus)" do

    it "can insert into an empty list" do
      @l.insert(4)
      expect(@l.to_a).to eql [4]
    end

    it "can insert at the beginning" do
      @l.insert(4)
      @l.insert(2)
      expect(@l.to_a).to eql [2, 4]
    end

    it "can insert in the middle" do
      @l.insert(4)
      @l.insert(2)
      @l.insert(3)
      expect(@l.to_a).to eql [2, 3, 4]
    end
    
    it "can insert at the end" do
      @l.insert(4)
      @l.insert(2)
      @l.insert(3)
      @l.insert(5)
      expect(@l.to_a).to eql [2, 3, 4, 5]
    end
    
  end


  context "can find with a predicate block (bonus)" do

    # NOTE: since find returns a ListNode, to_a converts the list
    # which that node is the head of

    before(:each) do
      @l.append(1)
      @l.append(3)
      @l.append(4)
      @l.append(5)
      @l.append(6)
      @l.append(10)
    end

    it "can find the first even" do
      expect((@l.find {|i| i.even?}).to_a).to eql [4, 5, 6, 10]
    end
    
    it "can find something divisible by 2 and 3" do
      expect((@l.find {|i| i % 2 == 0 && i % 3 == 0}).to_a).to eql [6, 10]
    end
    
  end


  context "can map with another list" do

    before(:each) do
      @l.append(1)
      @l.append(2)
      @l.append(3)
      @l.append(4)
      @l2 = DBCLinkedList.new
      @l2.append(10)
      @l2.append(20)
      @l2.append(30)
      @l2.append(40)
    end

    it "can map + over two lists" do
      expect((@l.map_with(@l2) {|a, b| a + b}).to_a).to eql [11, 22, 33, 44]
    end

  end
end
