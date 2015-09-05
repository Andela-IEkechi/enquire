Feature: Doctor roles around
  As a registered doctor on Cadwings
  I need to be able to sign into Cadwings
  So that I can have access to serve the users better under my hospital

  @javascript
  Scenario: Doctor roles around
    Given there is a verified hospital named "Cadhoose"
    And "Will" is a registered "doctor" with email "willsiva19@gmail.com" and password "Secretkey"
    And Will is a verified doctor associated with Cadhoose
    When Will is on the user sign in page
    And he fill in the following:
      | Email                 | willsiva19@gmail.com |
      | Password              | Secretkey            |
    And he press "Log in"
    Then he should see "Signed in successfully."
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    Then he should see "Profile"
    And he should see "Hospitals"
    And he should see "Questions"
    And he should see "Everyone"
    And he should see "Articles"
    And he should see "Settings"
    And he should see "Log Out"