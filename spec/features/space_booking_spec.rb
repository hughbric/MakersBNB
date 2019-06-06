require 'spec_helper'

require_relative '../helpers/helpers'

feature 'Booking a space' do

  scenario 'the space user books a space' do
    sign_up
    list_space
    click_link('spaceID_1')
    expect(page).to have_content 'Please book your space'
    expect(page).to have_content 'Comfortable warm bed, double room.'
    expect(page).to have_button'Request booking'
  end

end
