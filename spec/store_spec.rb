require 'spec_helper'

describe 'Stores' do
  it "should not save if the record doesn't have a number" do
    new_store = Store.create(name: '')
    expect(Store.all).to eq([])
  end
  it "should titlize name" do
    new_store = Store.create(name: 'addidas')
    expect(Store.all.first.name).to eq('Addidas')
  end
end
