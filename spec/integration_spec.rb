require 'spec_helper'

describe 'stores resource', type: :feature do
  it "lists the stores on the screen" do
    new_store = Store.create(name: "nike", location: "Beaverton")
    visit('/')
    expect(page).to have_content('nike')
  end
  it "user creates a new store and it takes them to store page" do
    new_store = Store.create(name: "nike", location: "Beaverton")
    visit('/')
    click_on('New Store')
    fill_in('name', with: 'addidas')
    fill_in('location', with: 'MLK')
    click_on('Add Store')
    expect(page).to have_content('MLK')
  end

  it "user deletes a store and it takes them to index" do
    new_store = Store.create(name: "nike", location: "Beaverton")
    visit('/')
    click_on('New Store')
    fill_in('name', with: 'addidas')
    fill_in('location', with: 'MLK')
    click_on('Add Store')
    click_on('Delete')
    expect(current_url).to eq('http://www.example.com/')
  end
end
