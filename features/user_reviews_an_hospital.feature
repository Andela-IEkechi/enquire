Feature: User writes a review for an hospital
  As a user on Cadwings
  I just have either my first, or another experience with an hospital
  So I decide to give my review (good or bad) about the hospital

  @javascript
  Scenario: User writes a review for an hospital
    Given there is a verified hospital named "MechoMedics"
    And "Janet" is a registered "user" with email "janet@example.com" and password "mysecretpass"
    And she is on the user sign in page
    And she fill in the following:
      | Email     | janet@example.com |
      | Password  | mysecretpass      |
    And she press "Log in"
    When she waits for 5 seconds
    And she follow "menu-collapsible"
    And she follows "Hospitals"
    And she follow "View"
    Then she should see "Your Review"
    And she should see "POST REVIEW"
    When she fill in "review_content" with "Well, right now, I am not sure if I can get a better care from somewhere else, all things considered. I am so happy. :D"
    And she press "Post Review"
    Then she should see "Your Review has been successfully posted."
    And she should see "Well, right now, I am not sure if I can get a better care from somewhere else, all things considered. I am so happy. :D"
    And she should not see "POST REVIEW"
