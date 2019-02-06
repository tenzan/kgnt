require 'rails_helper'

RSpec.feature 'Users can create new categories' do
    before do
        FactoryBot.create(:category, name: 'Toys')

        visit '/'
        click_link 'New Category'
    end

    scenario 'with valid attributes' do
        fill_in "Name",	with: "Computers"
     
        click_button 'Create Category'
        
        expect(page).to have_content 'Category successfully created' 
    end

    scenario 'when providing invalid attributes' do
        click_button 'Create Category'

        expect(page).to have_content 'Category has not been created'
        expect(page).to have_content "Name can't be blank" 
    end

    scenario 'with unique name' do
        fill_in "Name",	with: "Toys"
        click_button 'Create Category'

        expect(page).to have_content 'Category has not been created'
        expect(page).to have_content 'Name has already been taken'
    end
end