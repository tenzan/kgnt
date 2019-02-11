require 'rails_helper'

RSpec.feature "Users can edit existing posts" do
    let(:category) { FactoryBot.create(:category) }
    let(:post)  { FactoryBot.create(:post, category: category) }
  
    before do
      visit category_post_path(category, post)
      click_link "Edit Post"
    end
  
    scenario "with valid attributes" do
        fill_in "Title",	with: "Toyota2"
        fill_in "Description",	with: "Some detailed information"
        fill_in "Location",	with: "Tokyo"
        fill_in "Price",	with: "1000"
        choose "USD"
        fill_in "Phone",	with: "111-2222-3333"
        choose "Sell"    

      click_button "Update Post"
  
      expect(page).to have_content "Post has been updated."
  
      expect(page).to have_content "Toyota"
      expect(page).to have_content "Some detailed information"
      expect(page).to have_content "Tokyo"
      expect(page).to have_content "1,000"
      expect(page).to have_content "USD"
      expect(page).to have_content "111-2222-3333"
      expect(page).to have_content "Sell"
      expect(page).not_to have_content post.title
    end
  
    scenario "with invalid attributes" do
        fill_in "Title",	with: ""
        fill_in "Description",	with: ""
        fill_in "Location",	with: ""
        fill_in "Price",	with: ""  

      click_button "Update Post"
  
      expect(page).to have_content "Post has not been updated."
    end
  end