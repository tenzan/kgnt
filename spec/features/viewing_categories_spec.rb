require 'rails_helper'

RSpec.feature 'Users can view categories' do
    scenario 'with the category details' do
        category = FactoryBot.create(:category, name: 'Real Estate')

        visit '/categories'
        click_link('Real Estate')
        expect(page).to have_current_path(category_url(category))
    end
end