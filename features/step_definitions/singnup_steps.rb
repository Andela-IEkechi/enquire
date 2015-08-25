Given(/^I am on the signup page$/) do
  visit "/users/sign_up"
end

Then(/^the Sign up form should be shown again$/) do
  current_path.should == new_user_registration_path
end

Then(/^I should not be registered$/) do
  assert_nil User.find_by_email("manisiva19@gmail.com")
end

Then(/^I should be successfully registered$/) do
  User.find_by_email("manisiva19@gmail.com")
end