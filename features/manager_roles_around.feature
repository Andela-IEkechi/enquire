Feature: Manager roles around
  As a registered manager on cadwings
  I need to be able to login to Cadwings and role around
  While some pages will be un-accessible by me

  @javascript
  Scenario: Manager roles around
    Given "Will" is a registered "manager" with email "willsiva19@gmail.com" and password "Secretkey"
    And "Will" has a verified hospital named "John Hopkins"
    And "John Hopkins" hospital has a verified doctor named "Jack"
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
    And he should not see "Questions"
    And he should see "Articles"
    And he should see "Settings"
    And he should see "Log Out"
    When he follows "Profile"
    Then he should see "My Dashboard"
    And he should see "Doctors List"
    And he should not see "Verify Hospital"
    When he follows "Doctors List"
    Then he should see "Jack"
    And he follow "menu-collapsible"
    When he follows "Hospital"
    Then he should see "John Hopkins"
    Given John Hopkins hospital is un-verified
    When he reloads the page
    And he follow "menu-collapsible"
    Then he should see "Profile"
    When he follows "Profile"
    And he should see "Verify Hospital"