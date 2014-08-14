require_relative '../lib/dbc_circular_queue.rb'
require 'spec_helper.rb'

describe 'A DbcQueue' do

  before(:each) do
    @queue = DbcCircularQueue.new(3)
  end

  it 'is empty when newly created' do
    expect(@queue).to be_empty
  end

  it 'is not full when newly created' do
    expect(@queue).to_not be_full
  end

  it 'raises an exception if dequeued while empty' do
    expect { @queue.dequeue }.to raise_error
  end

  context 'with an element added' do
    before(:each) do
      @queue.enqueue(1)
    end

    it 'is not empty' do
      expect(@queue).to_not be_empty
    end

    it 'is not full' do
      expect(@queue).to_not be_full
    end

    context 'and dequeued' do
      before(:each) do
        @item = @queue.dequeue
      end
      it 'results in that element' do
        expect(@item).to eq(1)
      end
      it 'leaves the queue empty' do
        expect(@queue).to be_empty
      end
    end
  end

  context 'with three elements added' do
    before(:each) do
      @queue.enqueue(1)
      @queue.enqueue(2)
      @queue.enqueue(3)
    end

    it 'dequeues in the same order that they were added' do
      expect(@queue.dequeue).to eq(1)
      expect(@queue.dequeue).to eq(2)
      expect(@queue.dequeue).to eq(3)
    end

    it 'is full' do
      expect(@queue).to be_full
    end

    it 'raises an exception when a fourth item is added' do
      expect { @queue.enqueue(42) }.to raise_error
    end
    
  end

end
