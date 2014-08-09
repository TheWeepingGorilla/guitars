require 'spec_helper'

describe 'Brand' do
  describe 'initialize' do
    it 'initializes an brand' do
      new_brand = Brand.new({:brand => "Fender"})
      expect(new_brand).to be_a Brand
    end
  end

  describe 'save' do
    it 'saves an brand to the database' do
      new_brand = Brand.new({:brand => "Fender"})
      new_brand.save
      expect(Brand.all).to eq [new_brand]
    end
  end

  describe '.all' do
    it 'returns all brands in the brands table' do
      new_brand = Brand.new({:brand => "Fender"})
      new_brand.save
      new_brand2 = Brand.new({:brand => "Gibson"})
      new_brand2.save
      expect(Brand.all).to eq [new_brand, new_brand2]
    end
  end

  describe 'delete' do
    it 'lets you delete a brand' do
      new_brand = Brand.new({:brand => "Fender"})
      new_brand.save
      new_brand.delete
      expect(Brand.all).to eq []
    end
  end
end
