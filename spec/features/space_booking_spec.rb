require 'spec_helper'

feature 'Booking a space' do
  scenario 'the space user books a space' do
    visit '/spaces'
    save_and_open_page
    fill_in 'checkin', with: '20/07/2019'
    fill_in 'checkout', with: '22/07/2019'

    find_link("a").click
    expect(page).to have_content 'Your space has been booked!'
  end
end