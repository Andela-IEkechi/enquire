Given(/"([^"]*)" (?:am|is) a registered "([^"]*)" with email "([^"]*)" and password "([^"]*)"/) do |name, role, email, password|
  user = FactoryGirl.create(:user, name: name, email: email, password: password)
  user.update_attributes(role: "#{role}")
end

Given(/^(?:I|he|she) (?:am|is) on the signup page$/) do
  visit "/users/sign_up"
end

Given(/^(?:I|he|she) (?:am|is) on the login page$/) do
  visit "/users/sign_in"
end

Then(/^the Sign up form should be shown again$/) do
  current_path.should == new_user_registration_path
end

Then(/^the Login form should be shown again$/) do
  current_path.should == new_user_session_path
end

Then(/^I should not be registered$/) do
  assert_nil User.find_by_email("manisiva19@gmail.com")
end

Then(/^I should be successfully registered$/) do
  User.find_by_email("manisiva19@gmail.com")
end