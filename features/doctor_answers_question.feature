Feature: Doctor signs in and answers a Question
  As a registered verified doctor on the platform
  I need to sign in and view questions asked
  So that I can provide solution to people's health concerns

  @javascript
  Scenario: Doctor signs in to answer a question
    Given there is a question already asked by a client
    And "Jack" is a registered "doctor" with email "jacksiva19@gmail.com" and password "Secretkey"
    And Jack is a verified doctor
    When he is on the user sign in page
    And he fill in the following:
      | Email                 | jacksiva19@gmail.com |
      | Password              | Secretkey            |
    And he press "Log in"
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    And he follows "Questions"
    Then he should see "Questions"
    And he should see "VIEW"
    And he should see "ANSWER"
    When he follow "Answer"
    And he waits for 1 seconds
    And he fill in "Answer" with "What the heck yo talking bout nigg?"
    And he press "Post Help"
    Then he should see "Answer was successfully posted."
    When he goes to the questions page
    And he follow "View"
    Then he should see "CONTRIBUTE"
    When he follow "Contribute"
    And he fill in "Answer" with "What the heck yo talking bout nigg?"
    And he press "Post Help"
    Then he should see "Answer was successfully posted."
