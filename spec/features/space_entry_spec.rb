require 'spec_helper'

feature 'Adding a space' do
  scenario 'user should be able to add a space' do
    visit '/spaces/new'
    fill_in('name', with: 'Comfortable warm bed, double room.')
    fill_in('description', with: 'Lorem Ipsum')
    fill_in('price', with: '100')
    fill_in 'checkin', with: '20/07/2019'
    fill_in 'checkout', with: '22/07/2019'
    click_button 'List space'
    expect(page).to have_content('Comfortable warm bed, double room.')
  end
end
