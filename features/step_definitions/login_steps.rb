Given /^a valid user$/ do
  @user = User.create!({
             :email => "example@example.com",
             :password => "12345678",
             :password_confirmation => "12345678"
           })
end

Given /^a logged in user$/ do
  step "a valid user"
  visit new_user_session_url
  fill_in "Email", :with => "example@example.com"
  fill_in "Password", :with => "12345678"
  click_button "Sign in"
end

Given /^I am logged in$/ do
  step "a logged in user"
end
