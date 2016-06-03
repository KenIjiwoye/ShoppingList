require 'rails_helper.rb'

feature 'New items functionality' do 
	background do 
		user = create(:user)	
		
	end
	scenario 'add new items' do 
		visit '/'
		click_on 'Sign In'
		fill_in 'Email', with: "joe@test.com"
		fill_in 'Password', with: "password"
		click_on 'Log in'
		click_on 'Add new items'
		fill_in 'Title', with: "Yo"
		fill_in 'Description', with: "body"
		click_on 'Create Item'

		expect(page).to have_content("Yo")
		
	end
end