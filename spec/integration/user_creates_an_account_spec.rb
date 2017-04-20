require 'rails_helper.rb'

feature "User can create an account and log in" do
    scenario "Creates account and logs in with correct credentials" do
        visit '/'
        expect(page).to have_content("Log In")
        click_link('Sign Up')
        expect(page).to have_content("Join Loot Today!")
        fill_in('account[username]', :with => 'Test')
        fill_in('account[password]', :with => 'password')
        click_button("Create Account")
        expect(page).to have_content("Log In")
        fill_in('Username', :with => 'Test')
        fill_in('Password', :with => 'password')
        click_button("Log In")
        expect(page).to have_content("Budgets")
    end
    
    scenario "Creates account and logs in with incorrect credentials" do
        visit '/'
        expect(page).to have_content("Log In")
        click_link('Sign Up')
        expect(page).to have_content("Join Loot Today!")
        fill_in('account[username]', :with => 'Test')
        fill_in('account[password]', :with => 'password')
        click_button("Create Account")
        expect(page).to have_content("Log In")
        fill_in('Username', :with => 'Test')
        fill_in('Password', :with => 'password1')
        click_button("Log In")
        expect(page).to have_no_content("Budgets")
        expect(page).to have_content("Log In")
    end
    
end

feature "User should be able to create budgets" do
    scenario "Creates a budget" do
        visit '/'
        expect(page).to have_content("Log In")
        click_link('Sign Up')
        expect(page).to have_content("Join Loot Today!")
        fill_in('account[username]', :with => 'Test')
        fill_in('account[password]', :with => 'password')
        click_button("Create Account")
        expect(page).to have_content("Log In")
        fill_in('Username', :with => 'Test')
        fill_in('Password', :with => 'password')
        click_button("Log In")
        expect(page).to have_content("Log out")
        expect(page).to have_content("Budgets")
        click_button("New Budget")
        expect(page).to have_content("New Budget")
        
        within_fieldset(:name) do
            fill_in 'Name', with: 'Budget 2017'
        end
        within_fieldset(:limit) do
            fill_in 'Limit', with: '1500.00'
        end
        
        click_button("Create Budget")
        expect(page).to have_content("Budget 2017")
        
        
    end
end