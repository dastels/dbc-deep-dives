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
end
