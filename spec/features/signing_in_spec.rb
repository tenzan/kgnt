RSpec.feature "Users can sign in" do
    let!(:user) { FactoryBot.create(:user) }

     scenario "with valid credentials" do
      visit "/"
      click_link "Sign in"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"

       expect(page).to have_content "Signed in successfully."
       expect(page).to have_content "Signed in as #{user.name}"
       expect(subject).not_to have_content "Sign in"
       expect(subject).not_to have_content "Sign up"
    end
end 