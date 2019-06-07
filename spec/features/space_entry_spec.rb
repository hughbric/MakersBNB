require 'spec_helper'

require_relative '../helpers/helpers'

feature 'Adding a space' do
  scenario 'user should be able to add a space' do
    sign_up
    list_space
    expect(page).to have_content('Comfortable warm bed, double room.')
  end
end
