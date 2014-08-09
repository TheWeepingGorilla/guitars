require 'spec_helper'

describe 'Body' do
  describe 'initialize' do
    it 'initializes an body type' do
      new_body = Body.new({:body => "Strat"})
      expect(new_body).to be_a Body
    end
  end

  describe 'save' do
    it 'saves an body to the database' do
      new_body = Body.new({:body => "Strat"})
      new_body.save
      expect(Body.all).to eq [new_body]
    end
  end

  describe '.all' do
    it 'returns all bodies in the body table' do
      new_body = Body.new({:body => "Strat"})
      new_body.save
      new_body2 = Body.new({:body => "Les Paul"})
      new_body2.save
      expect(Body.all).to eq [new_body, new_body2]
    end
  end

  describe 'delete' do
    it 'lets you delete a body' do
      new_body = Body.new({:body => "Strat"})
      new_body.save
      new_body.delete
      expect(Body.all).to eq []
    end
  end
end
