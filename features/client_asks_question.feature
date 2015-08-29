Feature: Client asks question
  As a client
  I have an issue I want to ask a doctor about
  So, I log in to ask my question

  @javascript
  Scenario: Client signs in to ask a question
    Given "Janet" is a registered "user" with email "janet@example.com" and password "mysecretpass"
    And she is on the user sign in page
    And she fill in the following:
      | Email     | janet@example.com |
      | Password  | mysecretpass      |
    And she press "Log in"
    Then she should see "Signed in successfully."
    And she should see "Ask a Question"
    When she waits for 5 seconds
    And she follows "Ask a Question"
    When she waits for 1 seconds
    Then she should be on the new question page
    When she fill in "question_body" with "What is the best way to make my man go up to 6 rounds in a row?"
    When she fill in "question_all_tags" with "bitch life"
    And she press "Ask the Doc"
    Then she should see "Question was successfully created."
