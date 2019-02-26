RSpec.feature "Signed-in users can sign out" do
    let!(:user) { FactoryBot.create(:user) }

    scenario do
        visit "/"
        click_link "Sign in"
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"

        click_link "Sign out"
        expect(page).to have_content "Signed out successfully."
        expect(page).not_to have_content('Sign out')
        expect(page).to have_content('Sign in')
        expect(page).to have_content('Sign up')
    end
end