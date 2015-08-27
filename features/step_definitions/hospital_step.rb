Given /^There is an admin for Cadwings$/ do
  FactoryGirl.create(:user, :admin)
end

Given /^"([^"]*)" has a verified hospital$/ do |name|
  manager = User.find_by(name: name)
  FactoryGirl.create(:hospital, :verified, manager: manager)
end