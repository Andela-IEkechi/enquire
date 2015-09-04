Given /^(?:There|"([^"]*)") is an admin for Cadwings$/ do |name|
  name ||= "admin"
  FactoryGirl.create(:user, :admin, name: name, email: "admintest@cadwings.com", password: "Secretkey")
end

Given /^"([^"]*)" has a verified hospital named "([^"]*)"$/ do |manager_name, hospital_name|
  manager = User.find_by(name: manager_name)
  FactoryGirl.create(:hospital, :verified, manager: manager, name: hospital_name)
end

Given /^there is an hospital verification request from "([^"]*)" for "([^"]*)" hospital$/ do |manager_name, hospital_name|
  manager = User.find_by(name: manager_name) || FactoryGirl.create(:user, :manager, name: manager_name)
  hospital = Hospital.find_by(name: hospital_name) || FactoryGirl.create(:hospital, verified: false, name: hospital_name, manager: manager)
  FactoryGirl.create(:hospital_verification_request, user: manager, hospital: hospital)
end

Given /^(.+) is a verified doctor$/ do |doc_name|
  doctor = User.find_by(name: doc_name)
  doctor.update_column(:verified, true)
end

Given /^there is a verified hospital named "([^"]*)"$/ do |hospital_name|
  hospital = FactoryGirl.create(:hospital, :verified, name: hospital_name)
  FactoryGirl.create(:hospital_list, hospital: hospital)
end

Given /^"([^"]*)" hospital has a verified doctor named "([^"]*)"$/ do |hospital_name, doc_name|
  hospital = Hospital.find_by(name: hospital_name)
  doc = FactoryGirl.create(:user, :verified_doctor, name: doc_name, hospital: hospital)
  FactoryGirl.create(:doctor_list, hospital: hospital, user: doc)
end