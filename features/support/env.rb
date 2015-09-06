require 'cucumber/rails'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'
require 'factory_girl'

ENV["RAILS_ENV"] ||= 'test'

ActionController::Base.allow_rescue = false


DatabaseCleaner.strategy = :transaction
Cucumber::Rails::Database.javascript_strategy = :truncation

# Capybara.default_selector = :css

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.javascript_driver = :chrome

