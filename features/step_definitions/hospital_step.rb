Given /^(?:There|"([^"]*)") is an admin for Cadwings$/ do |name|
  name ||= "admin"
  FactoryGirl.create(:user, :admin, name: name, email: "admintest@cadwings.com", password: "Secretkey")
end

Given /^"([^"]*)" has a verified hospital$/ do |name|
  manager = User.find_by(name: name)
  FactoryGirl.create(:hospital, :verified, manager: manager)
end

Given /^there is an hospital verification request from "([^"]*)" for "([^"]*)" hospital$/ do |manager_name, hospital_name|
  manager = User.find_by(name: manager_name) || FactoryGirl.create(:user, :manager, name: manager_name)
  hospital = Hospital.find_by(name: hospital_name) || FactoryGirl.create(:hospital, verified: false, name: hospital_name, manager: manager)
  FactoryGirl.create(:hospital_verification_request, user: manager, hospital: hospital)
end