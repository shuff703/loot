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
    
    scenario "User should not be able to log in with incorrect credentials" do
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
        expect(page).to have_content("Budgets")
        click_link("New Budget")
        expect(page).to have_content("New Budget")
    
        fill_in "Name", :with => 'Budget 2017'
        fill_in "Limit", :with => '1500.00'
        
        click_button("Create Budget")
        expect(page).to have_content("Budget 2017")
        
        
    end
    
end



feature "User should be able to create transactions" do
    scenario "Creates a transaction" do
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
        click_link("New Budget")
        expect(page).to have_content("New Budget")
    
        fill_in "Name", :with => 'Budget 2017'
        fill_in "Limit", :with => '1500.00'
        
        click_button("Create Budget")
        expect(page).to have_content("Budget 2017")
        
        expect(page).to have_content("Add Transaction")
        
        click_link("Add Transaction")
        expect(page).to have_content("New Transaction")
        
        fill_in "transaction[recipient]", :with => 'Starbucks'
        fill_in "transaction[amount]", :with => '20.00'
        select "Food", :from => "transaction[category]"
        fill_in "transaction[date]", :with => '04/27/2017'
        
        click_button("Create Transaction")
        
        expect(page).to have_content("Starbucks 20.0")
        
    end
    
end