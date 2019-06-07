feature 'Filters' do
	
	scenario 'dates enetered with no spaces within that range' do
		sign_up
    	list_space
    	fill_in('available_from',with: '10/07/2019')
    	fill_in('available_to',with: '19/07/2019')
    	click_button 'Filter Spaces'
    	expect(page).not_to have_content('Comfortable warm bed, double room.')
	end

end
