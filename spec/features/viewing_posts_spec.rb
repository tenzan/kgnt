require 'rails_helper'

RSpec.feature 'Users can view posts' do
  before do
    cars = FactoryBot.create(:category, name: 'Cars')
    FactoryBot.create(:post, category: cars, 
                        title: "In best condition!",
                        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        location: "Tokyo",
                        price: 1000,
                        currency: "USD",
                        phone: "111-2222-3333",
                        purpose: "Sell")

    house = FactoryBot.create(:category, name: 'House')
    FactoryBot.create(:post, category: house, title: "Urgent sell!")

    visit '/'
  end

  scenario 'for a given category' do
    click_link 'Cars'

    expect(page).to have_content 'In best condition!'
    expect(page).to_not have_content 'Urgent sell!"'
    
    click_link 'In best condition!'

    expect(page).to have_content "In best condition!"
    expect(page).to have_content "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    expect(page).to have_content "Tokyo"
    expect(page).to have_content "1,000"
    expect(page).to have_content "USD"
    expect(page).to have_content "111-2222-3333"
    expect(page).to have_content "Sell"
  end

end