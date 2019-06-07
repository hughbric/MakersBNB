require 'spec_helper'

require_relative '../helpers/helpers'

feature 'Login' do
  scenario 'an existing user navigates to the log in page' do
    sign_up
    logout
    login
    expect(page).to have_content("Book a Space")
  end

  scenario 'a user cannot login with the wrong password' do
    sign_up
    logout
    visit('/')
    click_link 'Log in'
    fill_in 'email', with: 'user@makersbnb.com'
    fill_in 'password', with: 'incorrect'
    click_button 'Log in'
    expect(page).to have_content("Your username or password is incorrect")
  end
end
