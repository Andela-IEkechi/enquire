Feature: User views a hospital's details
  As a user on cadwings
  I need to check out the registered hospitals
  So I signed in to do just that

  @javascript
  Scenario: User views a hospital's details and even checks the profiles of doctors under that hospital
    Given there is a verified hospital named "MechoMedics"
    And "MechoMedics" hospital has a verified doctor named "Carson"
    And "Janet" is a registered "user" with email "janet@example.com" and password "mysecretpass"
    And she is on the user sign in page
    And she fill in the following:
      | Email     | janet@example.com |
      | Password  | mysecretpass      |
    And she press "Log in"
    Then she should see "Signed in successfully."
    When she waits for 5 seconds
    And she follow "menu-collapsible"
    And she follows "Hospitals"
    Then she should see "MechoMedics"
    And she should see "VIEW"
    When she follow "View"
    Then she should see "MechoMedics"
    And she should see "MEET OUR DOCTORS"
    When she follow "Meet Our Doctors"
    Then she should see "Carson"
    And she should see "VIEW"
    When she follow "View"
    Then she should see "Name:"
    And she should see "Occupation:"
    And she should see "Age:"
