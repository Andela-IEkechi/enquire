Feature: User follows a question
  As a user
  When I see a question that I am interested in,
  I followed it, so that it can appear in my follows

  @javascript
  Scenario: User follows a question
    Given there is 1 question already asked by clients
    And "Will" is a registered "user" with email "willexample@gmail.com" and password "mysecretpass"
    And he is on the user sign in page
    And he fill in the following:
      | Email     | willexample@gmail.com |
      | Password  | mysecretpass          |
    And he press "Log in"
    Then he should see "Signed in successfully."
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    And he follows "Questions"
    Then he should see "Questions"
    And he should see "VIEW"
    And he should see "Follow"
    When he follow "Follow"
    Then he should see "You have successfully followed the Question."
    And he waits for 5 seconds
    And he should not see "Follow"
    When he follow "Following"
    Then he should see "VIEW"