require 'spec_helper'

require_relative '../helpers/helpers'

feature "Logging out" do
  scenario "the user ends a session by logging out" do
    sign_up
    logout
    expect(page).to have_content("Log in to MakersBnB")
  end
end
