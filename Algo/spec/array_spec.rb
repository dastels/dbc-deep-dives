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


  context 'after adding several items' do

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

  end


end
