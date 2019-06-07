require 'spec_helper'

require_relative '../helpers/helpers'

feature "The space owner can approve and deny requests" do
  scenario "The space owner can see the active request" do
    sign_up
    list_space
    logout
    other_sign_up
    book_space
    logout
    login
    click_link 'Requests'
    click_link('bookingID_1')
    expect(page).to have_content "Request for 'Comfortable warm bed, double room.'"
    expect(page).to have_selector(:link_or_button, 'Confirm')
  end
end
