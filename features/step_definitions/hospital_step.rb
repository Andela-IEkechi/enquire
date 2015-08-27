Given /^"([^"]*)" has a verified hospital$/ do |name|
  manager = User.find_by(name: name)
  FactoryGirl.create(:hospital, :verified, manager: manager)
end