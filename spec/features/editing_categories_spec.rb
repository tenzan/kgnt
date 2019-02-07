require 'rails_helper'

RSpec.feature 'Users can edit existing categories' do
  before do
    FactoryBot.create(:category, name: 'Apartments')
    visit '/'
    click_link 'Apartments'
    click_link 'Edit Category'
  end

  scenario 'with valid attributes' do
    fill_in "Name",	with: "Real Estate"
    click_button 'Update Category'
    
    expect(page).to have_content 'Category was successfully updated' 
    expect(page).to have_content 'Real Estate' 
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Category"
  
    expect(page).to have_content "Category has not been updated"
  end
end