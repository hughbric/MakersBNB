require 'spec_helper'
require_relative '../helpers/list_space'

feature 'Booking a space' do
  
  scenario 'the space user books a space' do
    list_space
    click_link('spaceID_1')
    expect(page).to have_content 'Please book your space'
    expect(page).to have_content 'Comfortable warm bed, double room.'
    expect(page).to have_button'Request booking'
  end

end
