Feature: Admin roles around Cadwings
  As an Admin on Cadwings
  If I am logged in, I should be able to check doctors list as well as All hospitals, etc.

  @javascript
  Scenario: Admin roles around Cadwings
    Given there is a verified hospital named "Cadwingoos"
    And "Will" is an admin for Cadwings
    When he is on the user sign in page
    When he fill in the following:
      | Email                 | admintest@cadwings.com |
      | Password              | Secretkey              |
    And he press "Log in"
    Then he should see "Signed in successfully."
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    And he follows "Profile"
    When he follows "Dashboard"
    Then he should see "Dashboard"
    When he follow "menu-collapsible"
    And he follows "Profile"
    And he follows "Hospitals List"
    Then he should see "Hospitals"
    And he should see "Cadwingoos"


  @javascript
  Scenario: Admin roles unverifies an hospital
    Given there is a verified hospital named "Cadwingoos"
    And "Will" is an admin for Cadwings
    When he is on the user sign in page
    When he fill in the following:
      | Email                 | admintest@cadwings.com |
      | Password              | Secretkey              |
    And he press "Log in"
    Then he should see "Signed in successfully."
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    And he follows "Profile"
    And he follows "Hospitals List"
    Then he should see "Hospitals"
    And he should see "Cadwingoos"
    And he should see "Un-verify"
    When he follows "Un-verify"
    And he waits for 1 seconds
    And he confirms popup
    Then he should see "Hospital has been unverified."