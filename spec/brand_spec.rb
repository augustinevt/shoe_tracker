require 'spec_helper'

describe 'Brand' do
  it "should not save if the record doesn't have a number" do
    new_brand = Brand.create(name: '')
    expect(Brand.all).to eq([])
  end
end
