Feature: User recommends an hospital
  As a user on Cadwings
  I really enjoyed the services of an hospital
  So I give my "+1" recommendation for it

  @javascript
  Scenario: User recommends an hospital
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
    Then she should see "0 Recommendations"
    And the page should have a ".recommend"
    When she press "recommend"
    Then she should see "1 Recommendations"
    And the page should not have a ".recommend"