require_relative '../lib/dbc_stack.rb'
require 'spec_helper.rb'

describe 'A DbcStack' do

  before(:each) do
    @stack = DbcStack.new
  end

  it "is empty when newly created" do
    expect(@stack).to be_empty
  end

  it "raises an exception if popped while empty" do
    expect { @stack.pop }.to raise_error
  end

  it "raises an exception if peeked while empty" do
    expect { @stack.peek }.to raise_error
  end

  context "with an element added" do
    before(:each) do
      @stack.push(1)
    end

    it "is not empty" do
      expect(@stack).to_not be_empty
    end

    context "and popped" do
      before(:each) do
        @item = @stack.pop
      end
      it "results in that element" do
        expect(@item).to eq(1)
      end
      it "leaves the queue empty" do
        expect(@stack).to be_empty
      end
    end

    context "and peeked at" do
      before(:each) do
        @item = @stack.peek
      end
      it "results in that element" do
        expect(@item).to eq(1)
      end
      it "does not leave the stack empty" do
        expect(@stack).to_not be_empty
      end
    end
  end

  context "with three elements added" do
    before(:each) do
      @stack.push(1)
      @stack.push(2)
      @stack.push(3)
    end

    it "pops in the reverse order that they were pushed" do
      expect(@stack.pop).to eq(3)
      expect(@stack.pop).to eq(2)
      expect(@stack.pop).to eq(1)
    end
  end

end
