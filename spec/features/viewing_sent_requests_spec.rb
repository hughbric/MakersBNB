feature "User is able to view booking requests they have made" do
  scenario "the user checks the requests they have made" do
    sign_up
    list_space
    logout
    other_sign_up
    book_space
    click_link 'Requests'
    expect(page).to have_content("Requests I've made")
    expect(page).to have_content("Comfortable warm bed, double room.")
  end

  scenario "the request has not yet been confirmed or denied" do
    sign_up
    list_space
    logout
    other_sign_up
    book_space
    click_link 'Requests'
    expect(page).to have_content("Unconfirmed")
  end

  scenario "the request has been confirmed" do
    sign_up
    list_space
    logout
    other_sign_up
    book_space
    logout
    login
    click_link 'Requests'
    click_link('bookingID_1')
    find("#confirm").click
    logout
    other_login
    click_link 'Requests'
    expect(page).to have_content("Approved")
  end

  scenario "the request has been denied" do
    sign_up
    list_space
    logout
    other_sign_up
    book_space
    logout
    login
    click_link 'Requests'
    click_link('bookingID_1')
    find("#deny").click
    logout
    other_login
    click_link 'Requests'
    expect(page).to have_content("Denied")
  end
end
