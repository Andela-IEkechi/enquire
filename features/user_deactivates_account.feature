Feature: User deactivates account
  As a registered user on Cadwings
  If I am disatisfied, or I need to cancel my account for any reason
  I should be able to easilly do so.

  @javascript
  Scenario: User deactivates account
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
    Then he should see "Cancel my account"
    When he follows "Cancel my account"
    And he waits for 1 seconds
    And he confirms popup
    And he waits for 1 seconds
    Then he should see "Bye! Your account has been successfully cancelled. We hope to see you again soon."


