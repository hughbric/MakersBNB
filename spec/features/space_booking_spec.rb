require 'spec_helper'
require_relative '../helpers/list_space'

feature 'Booking a space' do
  
  scenario 'the space user books a space' do
    visit('/')
    
    fill_in 'email', with: 'user@makersbnb.com'
    fill_in 'password', with: 'passw0rd'
    fill_in 'password_confirmation', with: 'passw0rd'
    click_button 'Sign up'

    # click_button 'List a space'
    visit('/spaces/new')

    fill_in('name', with: 'Comfortable warm bed, double room.')
    fill_in('description', with: 'Lorem Ipsum')
    fill_in('price', with: '100')
    fill_in 'checkin', with: '20/07/2019'
    fill_in 'checkout', with: '22/07/2019'
    click_button 'List space'

    click_link('spaceID_1')
    expect(page).to have_content 'Please book your space'
    expect(page).to have_content 'Comfortable warm bed, double room.'
    expect(page).to have_button'Request booking'
  end

end
