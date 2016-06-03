require 'rails_helper.rb'

feature 'User sessions' do 
	scenario 'user signs up for the first time' do 
		visit '/'
		click_on 'Get Started!'
		fill_in 'Email', with: "joe@test.com"
		fill_in 'Password', with: "password", :match => :prefer_exact
		fill_in 'Password confirmation', with: "password", :match => :prefer_exact
		click_on 'Sign up'
		expect(page).to have_content("Welcome! You have signed up successfully.")
	end

	scenario 'user sign up failed' do 
		visit '/'
		click_on 'Get Started!'
		fill_in 'Email', with: "joetest.com"
		fill_in 'Password', with: "password", :match => :prefer_exact
		fill_in 'Password confirmation', with: "password", :match => :prefer_exact
		click_on 'Sign up'
		expect(page).to have_content("Please review the problems below:")
	end

	scenario 'user signs in' do 
		user = create(:user)
		visit '/'
		click_on 'Sign In'
		fill_in 'Email', with: "joe@test.com"
		fill_in 'Password', with: "password", :match => :prefer_exact
		click_on 'Log in'
		expect(page).to have_content("Signed in successfully.")
	end
end