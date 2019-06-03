require 'spec_helper'

feature 'Adding a space' do
  scenario 'user should be able to add a space' do
    visit '/spaces/new'
    fill_in('name', with: 'Comfortable warm bed, double room.')
    fill_in('description', with: 'Lorem Ipsum')
    fill_in('price per night', with: '100')
    fill_in 'Start Date', with: '20/07/2019'
    fill_in 'End Date', with: '22/07/2019'
    click_button 'List space'
    expect(page).to have_content('Comfortable warm bed, double room.')
  end
end