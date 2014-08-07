require_relative '../lib/dbc_linked_list.rb'
require 'spec_helper.rb'


  # preppend head
  # insert
  # delete


describe "DBCLinkedList" do
   before(:each) do
     @l = DBCLinkedList.new
   end

  context "when fresh" do
    it "is empty" do
      expect(@l).to be_empty
    end
    it "has size of 0" do
      expect(@l).to have(0)
    end
    it "converts to an empty array" do
      expect(@l.to_a).to eql([])
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
      expect(@l).to have(1)
    end

    it "converts to a single element array" do
      expect(@l.to_a).to eql(["Rob"])
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
      expect(@l).to have(3)
    end

    it "converts to a 3 element array" do
      expect(@l.to_a).to eql(["Rob", "Dave", "Mike"])
    end

    it "can search for something not in the list" do
      expect(@l.find("Joe")).to be_nil
    end

    it "can find something" do
      expect(@l.find("Dave")).to eql(@item2)
    end

    it "can prepend" do
      @l.prepend("Marek")
      expect(@l.to_a).to eql(["Marek", "Rob", "Dave", "Mike"])
    end
  end
end
