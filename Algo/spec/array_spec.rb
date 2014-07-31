require_relative '../lib/dbc_array.rb'
require 'spec_helper.rb'

describe 'A DbcArray' do

  before(:each) do
    @array = DbcArray.new
  end

  context 'with nothing added' do

    it 'is empty' do
      expect(@array).to be_empty
    end

    it 'contains no items' do
      expect(@array).to have 0
    end

    it 'can insert items at index zero' do
      expect { @array.insert(1, at: 0) }.to_not raise_error
      expect(@array).to have 1
      expect(@array.at(0)).to eq 1
    end

    it 'raises an exception when accessing out of bounds' do
      expect { @array.at(1) }.to raise_error
    end

    it 'raises an exception when updating out of bounds' do
      expect { @array.at(1, put: 1) }.to raise_error
    end

    it 'raises an exception when removing out of bounds' do
      expect { @array.remove_at(1) }.to raise_error
    end

    it 'raises an exception when inserting out of bounds' do
      expect { @array.insert(42, at: 1) }.to raise_error
    end

  end


  context 'after adding an item' do

    before(:each) do
      @array.append(1)
    end

    it 'is not empty' do
      expect(@array).to_not be_empty
    end

    it 'contains one item' do
      expect(@array).to have 1
    end

    it 'can answer the value' do
      expect(@array.at(0)).to eq 1
    end

  end


  context 'with several items' do

    before(:each) do
      @array.append(1).append(2).append(3).append(4)
    end

    it 'is not empty' do
      expect(@array).to_not be_empty
    end

    it 'contains four items' do
      expect(@array).to have 4
    end

    it 'can answer values' do
      expect(@array.at(0)).to eq 1
      expect(@array.at(1)).to eq 2
      expect(@array.at(2)).to eq 3
      expect(@array.at(3)).to eq 4
    end

    it 'can update values' do
      @array.at(2, put: 42)
      expect(@array.at(2)).to eq 42
    end

    it 'can remove values, moving subsequent ones down' do
      @array.remove_at(1)
      expect(@array.at(1)).to eq 3
      expect(@array).to have 3
    end

    context 'and another item inserted' do
      before(:each) do
        @array.insert(42, at: 2)
      end

      it 'has an additional item' do
        expect(@array).to have 5
      end

      it 'has the new item in the right place' do
        expect(@array.at(2)).to eq 42
      end

      it 'moved the previous value out of the way' do
        expect(@array.at(3)).to eq 3
      end
      
    end

  end


end
