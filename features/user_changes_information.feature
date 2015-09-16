Feature: User changes his sign-up information
  As a registered user on Cadwings
  If I need to edit my information for any reason
  I should be able to easily do so.

  @javascript
  Scenario: User changes his sign-up information
    Given "Jack" is a registered "user" with email "manisiva19@gmail.com" and password "Secretkey"
    And he is on the user sign in page
    When he fill in the following:
      | Email                 | manisiva19@gmail.com |
      | Password              | Secretkey            |
    And he press "Log in"
    Then he should see "Signed in successfully."
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    Then he should see "Settings"
    When he follows "Settings"
    Then he should see "User Profile Settings"
    When he fill in "Name" with "Williams"
    And he fill in "Email" with "williams@example.com"
    And he fill in "Bio" with "Just the best girl's guy around ;)"
    And he press "Update"
    Then he should see "Current password can't be blank"
    When he fill in "user_current_password" with "Secretkeyss"
    And he press "Update"
    Then he should see "Current password is invalid"
    When he fill in "user_password" with "myNewPassword"
    And he fill in "user_password_confirmation" with "mySecretPassword"
    And he fill in "user_current_password" with "Secretkey"
    And he press "Update"
    Then he should see "Password confirmation doesn't match Password"
    When he fill in "user_password" with "myNewPassword"
    And he fill in "user_password_confirmation" with "myNewPassword"
    And he fill in "user_current_password" with "Secretkey"
    And he press "Update"
    Then he should see "Your account has been updated successfully."
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    And he follow "Profile"
    And he follow "My Dashboard"
    And he follow "Bio"
    Then he should see "Williams"
    And he should see "williams@example.com"
