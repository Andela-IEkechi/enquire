Feature: Sign in
  As an already registered user
  I want to login with my details
  So that I can use the platform

  @javascript
  Scenario: Wrong password
    Given "Jack" is a registered "user" with email "manisiva19@gmail.com" and password "Secretkey"
    And he is on the user sign in page
    When he fill in the following:
      | Email                 | example@gmail.com |
      | Password              | Secretkey         |
    And I press "Log in"
    Then the Login form should be shown again
    And I should see "Invalid email or password."

  @javascript
  Scenario: Right password and email
    Given "Jack" is a registered "user" with email "manisiva19@gmail.com" and password "Secretkey"
    And he is on the user sign in page
    When he fill in the following:
      | Email                 | manisiva19@gmail.com |
      | Password              | Secretkey            |
    And I press "Log in"
    And I should see "Signed in successfully."
