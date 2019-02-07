require "rails_helper"

RSpec.feature "Users can delete categories" do
  scenario "successfully" do
    FactoryBot.create(:category, name: "Apartments")

    visit "/"
    click_link "Apartments"
    click_link "Delete Category"

    expect(page).to have_content "Category has been deleted."
    expect(page).to have_current_path(categories_url)
    expect(page).to have_no_content "Apartments"
  end
end