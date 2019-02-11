require "rails_helper"

RSpec.feature "Users can delete post" do
  let(:category) { FactoryBot.create(:category) }
  let(:post)  { FactoryBot.create(:post, category: category) }

  before do
    visit category_post_path(category, post)
  end

  scenario "successfully" do
    click_link "Delete Post"

    expect(page).to have_content "Post has been deleted."
    expect(page.current_url).to eq category_url(category)
  end
end