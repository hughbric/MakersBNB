require 'spec_helper'

require_relative '../helpers/helpers'

feature 'Login' do
  scenario 'an existing user navigates to the log in page' do
    sign_up
    logout
    login
    expect(page).to have_content("Book a Space")
  end
end
