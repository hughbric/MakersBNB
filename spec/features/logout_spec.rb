feature "Logging out" do
  scenario "the user ends a session by logging out" do
    User.create(email: 'user@makersbnb.com', password: 'passw0rd')
    visit('/')
    click_link 'Log in'
    fill_in 'email', with: 'user@makersbnb.com'
    fill_in 'password', with: 'passw0rd'
    click_button 'Log in'
    expect(page).to have_link("Sign out")
    click_link 'Sign out'
    expect(page).to have_content("Log in to MakersBnB")
  end
end
