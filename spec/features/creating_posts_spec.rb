require "rails_helper"

RSpec.feature 'Users can create new Posts' do
    before do        
        category = FactoryBot.create(:category, name: 'Cars')

        visit category_path(category)
        click_link 'New Post'
    end

    scenario 'with valid attribute' do
        fill_in "Title",	with: "Toyota"
        fill_in "Description",	with: "Some detailed information"
        fill_in "Location",	with: "Tokyo"
        fill_in "Price",	with: "1000"
        choose "USD"
        fill_in "Phone",	with: "111-2222-3333"
        choose "Sell"

        click_button 'Create Post' 

        expect(page).to have_content 'Post has been created.' 
    end

    scenario 'with invalid attributes' do
      click_button 'Create Post'

      expect(page).to have_content 'Post has not been created.'
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Description can't be blank"
      expect(page).to have_content "Location can't be blank"
      expect(page).to have_content "Price can't be blank"
      expect(page).to have_content "Purpose can't be blank"
    end

    scenario "with an invalid description" do
        fill_in "Title",	with: "Toyota"
        fill_in "Description",	with: "It sucks"
        fill_in "Location",	with: "Tokyo"
        fill_in "Price",	with: "1000"
        choose "USD"
        fill_in "Phone",	with: "111-2222-3333"
        choose "Sell"

        click_button 'Create Post' 

        expect(page).to have_content "Post has not been created."
        expect(page).to have_content "Description is too short"
    end
end