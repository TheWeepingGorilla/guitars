require 'spec_helper'

describe 'Guitar' do
  describe 'initialize' do
    it 'initializes a guitar' do
      new_brand = Brand.new({:brand => "Fender"})
      new_brand.save
      new_brand2 = Brand.new({:brand => "Gibson"})
      new_brand2.save
      new_body = Body.new({:body => "Strat"})
      new_body.save
      new_body2 = Body.new({:body => "Les Paul"})
      new_body2.save
      new_guitar = Guitar.new({:brand_id => 1, :body_id => 1})
      expect(new_guitar).to be_a Guitar
    end
  end

  describe 'save' do
    it 'saves an guitar to the database' do
      new_brand = Brand.new({:brand => "Fender"})
      new_brand.save
      new_brand2 = Brand.new({:brand => "Gibson"})
      new_brand2.save
      new_body = Body.new({:body => "Strat"})
      new_body.save
      new_body2 = Body.new({:body => "Les Paul"})
      new_body2.save
      new_guitar = Guitar.new({:brand_id => 1, :body_id => 1})
      new_guitar.save
      expect(Guitar.all).to eq [new_guitar]
    end
  end

  describe '.all' do
    it 'returns all guitars in the guitar table' do
      new_brand = Brand.new({:brand => "Fender"})
      new_brand.save
      new_brand2 = Brand.new({:brand => "Gibson"})
      new_brand2.save
      new_body = Body.new({:body => "Strat"})
      new_body.save
      new_body2 = Body.new({:body => "Les Paul"})
      new_body2.save
      new_guitar = Guitar.new({:brand_id => 1, :body_id => 1})
      new_guitar.save
      new_guitar2 = Guitar.new({:brand_id => 2, :body_id => 2})
      new_guitar2.save
      expect(Guitar.all).to eq [new_guitar, new_guitar2]
    end
  end

  describe 'delete' do
    it 'lets you delete a guitar' do
      new_brand = Brand.new({:brand => "Fender"})
      new_brand.save
      new_body = Body.new({:body => "Strat"})
      new_body.save
      new_body.delete
      expect(Guitar.all).to eq []
    end
  end
end
