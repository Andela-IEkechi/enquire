Feature: User views answers to a question
  As a user on Cadwings
  After a question has been asked, and there are answers already
  I should be able to see answers provided by several doctors to a question

  @javascript
  Scenario: Client checks various answers to question
    Given "Janet" is a registered "user" with email "janet@example.com" and password "mysecretpass"
    And there is 1 question already asked by clients
    And she is on the user sign in page
    And she fill in the following:
      | Email     | janet@example.com |
      | Password  | mysecretpass      |
    And she press "Log in"
    Then she should see "Signed in successfully."
    When she waits for 5 seconds
    And she follow "menu-collapsible"
    And she follows "Questions"
    And she follow "View"
    Then she should not see "ANSWERS"
    Given all questions now have a few answers each
    And she reloads the page
    Then she should see "ANSWERS"
    When she follow "Answers"
    Then she should see "Answers"