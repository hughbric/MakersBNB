require 'spec_helper'

require_relative '../helpers/helpers'

feature "The user is able to view requests for their space" do
  scenario 'the user navigates to see the requests that have come in' do
    sign_up
    list_space
    book_space
    click_link 'Requests'
    expect(page).to have_content("Requests I've received")
    expect(page).to have_content("Comfortable warm bed, double room.")
  end
end
