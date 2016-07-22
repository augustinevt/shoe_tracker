require 'spec_helper'

describe 'Brands', type: :feature do
  it "should list all brands associated with store" do
    new_store = Store.create(name: "Bub's Shoes", location: "Beaverton")
    Brand.create(name: 'Nike', store_ids: [new_store.id()])
    visit('/')
    click_on('Bub\'s Shoes')
    expect(page).to have_content('Nike')
  end

  it "should allow user to create and associate a brand with a store" do
    new_store = Store.create(name: "Bub's Shoes", location: "Beaverton")
    Brand.create(name: 'Nike', store_ids: [new_store.id()])
    visit('/')
    click_on('Bub\'s Shoes')
    fill_in('brand_name', with: "Addidas")
    click_on('Add Brand')
    expect(page).to have_content('Addidas')
  end
  
end
