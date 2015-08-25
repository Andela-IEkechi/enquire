Feature: Sign up
  As an unauthorized user
  I want to signup with my details
  So that I can login

  @javascript
  Scenario: Password doesn't match confirmation
    Given I am on the signup page
    When I fill in the following:
      | Name                  | Wilson Manuewaolu    |
      | Email                 | manisiva19@gmail.com |
      | Password              | Secretkey            |
      | Password confirmation | Password1            |
    And I press "Sign Up"
    Then the Sign up form should be shown again
    And I should see "Password doesn't match confirmation"
    And I should not be registered

  Scenario: Password match confirmation
    Given I am on the signup page
    When I fill in the following:
      | Name                  | Wilson Manuewaolu    |
      | Email                 | manisiva19@gmail.com |
      | Password              | Secretkey            |
      | Password confirmation | Secretkey            |
    And I press "Sign Up"
    Then I should see "Welcome! You have signed up successfully."
    And I should be successfully registered