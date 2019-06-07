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
end
