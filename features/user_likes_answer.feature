Feature: User likes an answer
  As a registered user
  I see an answer that really addresses my issue
  So, I liked it

  @javascript
  Scenario: User likes an answer
    Given there is 1 question already asked by clients
    And all questions now have a few answers each
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
    And he follow "View"
    Then he should see "ANSWERS"
    When he follow "Answers"
    Then he should see "LIKE"
    When he follow "Like" on first answer
    And he waits for 1 seconds
    Then he should not see "LIKE" on first answer
    And the first answer should have been followed 1 times