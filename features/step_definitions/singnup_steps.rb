Given(/"([^"]*)" (?:am|is) a registered "([^"]*)" with email "([^"]*)" and password "([^"]*)"/) do |name, role, email, password|
  FactoryGirl.create(:user, name: name, email: email, password: password, role: role)
end

Given(/^(?:I|he|she|"([^"]*)") (?:am|is) logged in with password "([^"]*)"$/) do |name, password|
  user = User.find_by(name: name)
  step %{I am on the user sign in page}
  step %{I fill in "Email" with "#{user.email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Log in"}
end

Then(/^the Sign up form should be shown again$/) do
  current_path.should == new_user_registration_path
end

Then(/^the Login form should be shown again$/) do
  current_path.should == new_user_session_path
end

Then(/^I should not be registered$/) do
  User.find_by_email("manisiva19@gmail.com").should be_nil
end

Then(/^I should be successfully registered$/) do
  User.find_by_email("manisiva19@gmail.com")
end