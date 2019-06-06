require 'spec_helper'

require_relative '../helpers/helpers'

feature 'requests' do
  scenario 'a user can see a space in detail' do
    sign_up
    list_space
    click_link('spaceID_1')
    expect(page).to have_content 'Comfortable warm bed, double room.'
    expect(page).to have_button 'Request to Book'
  end

  scenario 'a user can request to book a space' do
    sign_up
    list_space
    click_link('spaceID_1')
    fill_in 'request_from', with: '21/07/2019'
    fill_in 'request_until', with: '22/07/2019'
    click_button 'Request to Book'
    expect(page).to have_content 'Book a Space'
  end
end
