require 'spec_helper'

require_relative '../helpers/helpers'

feature "flash error messages" do
	scenario "User leaves name field blank" do
		sign_up
		click_button 'List a space'
		click_button 'List space'
		expect(page).to have_content("Please fill in the required fields.")
	end

	scenario "User leaves description blank" do
		sign_up
		click_button 'List a space'
		fill_in('name', with: 'Comfortable warm bed, double room.')
		click_button 'List space'
		expect(page).to have_content("Please fill in the required fields.")
	end

	scenario "User puts letters in the price field" do
		sign_up
		click_button 'List a space'
		fill_in('name', with: 'Comfortable warm bed, double room.')
		fill_in('description', with: 'Lorem Ipsum')
		fill_in('price', with: 'a tenner')
		click_button 'List space'
		expect(page).to have_content("Please enter a number.")
	end

	scenario "User leaves checkin date empty" do
		sign_up
		click_button 'List a space'
		fill_in('name', with: 'Comfortable warm bed, double room.')
		fill_in('description', with: 'Lorem Ipsum')
		fill_in('price', with: '10')
		click_button 'List space'
		expect(page).to have_content("Please fill in the required fields.")
	end

	scenario "User leaves checkout date empty" do
		sign_up
		click_button 'List a space'
		fill_in('name', with: 'Comfortable warm bed, double room.')
		fill_in('description', with: 'Lorem Ipsum')
		fill_in('price', with: '10')
		fill_in('checkin', with: '21/07/2019')
		click_button 'List space'
		expect(page).to have_content("Please fill in the required fields.")
	end

	scenario "User books wrong dates" do
		sign_up
		list_space
		click_link('spaceID_1')
	    fill_in 'request_from', with: '22/07/2019'
	    fill_in 'request_until', with: '21/07/2019'
	    click_button 'Request to book'
	    expect(page).to have_content 'Please enter the correct dates.'
	end

end
