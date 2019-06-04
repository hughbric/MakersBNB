feature 'Login' do
  scenario 'an existing user navigates to the log in page' do
    visit('/')
    click_link 'Log in'
    expect(page).to have_content("Log in to MakersBnB")
    expect(page).to have_field("email")
    expect(page).to have_field("password")
    fill_in 'email', with: 'user@makersbnb.com'
    fill_in 'password', with: 'passw0rd'
    click_button 'Log in'
    expect(page).to have_content("Book a Space")
  end
end