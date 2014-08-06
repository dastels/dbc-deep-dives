require_relative '../lib/dbc_linked_list.rb'
require 'spec_helper.rb'


  # preppend head
  # insert
  # find
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
  end

  context "with several things in it" do
    before(:each) do
      @l.append("Rob")
      @l.append("Dave")
      @l.append("Mike")
    end

    it "is not empty" do
      expect(@l).to_not be_empty
    end

    it "has a size of 3" do
      expect(@l).to have(3)
    end
  end
end
