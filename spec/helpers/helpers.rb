def sign_up
  visit('/')
  fill_in 'email', with: 'user@makersbnb.com'
  fill_in 'password', with: 'passw0rd'
  fill_in 'password_confirmation', with: 'passw0rd'
  click_button 'Sign up'
end

def other_sign_up
  visit('/')
  fill_in 'email', with: 'other_user@makersbnb.com'
  fill_in 'password', with: 'passw0rd'
  fill_in 'password_confirmation', with: 'passw0rd'
  click_button 'Sign up'
end

def login
  visit('/')
  click_link 'Log in'
  fill_in 'email', with: 'user@makersbnb.com'
  fill_in 'password', with: 'passw0rd'
  click_button 'Log in'
end

def list_space
  click_button 'List a space'
  fill_in('name', with: 'Comfortable warm bed, double room.')
  fill_in('description', with: 'Lorem Ipsum')
  fill_in('price', with: '100')
  fill_in 'checkin', with: '20/07/2019'
  fill_in 'checkout', with: '22/07/2019'
  click_button 'List space'
end

def book_space
  click_link('spaceID_1')
  fill_in 'request_from', with: '21/07/2019'
  fill_in 'request_until', with: '22/07/2019'
  click_button 'Request to Book'
end

def logout
  expect(page).to have_link("Sign out")
  click_link 'Sign out'
end
