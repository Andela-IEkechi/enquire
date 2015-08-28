Feature: Admin manages managers/hospitals
  As an admin on the Cadwings platform
  I should be able to sign in, and see my notifications
  So that I can accept/rejects hospital verifications requests and un-verify hospitals, as the needs may arise

  @javascript
  Scenario: Admin checks notification and accepts verification for an hospital. then the manager sees it as verified.
    Given "Jack" is a registered "manager" with email "manisiva19@gmail.com" and password "Secretkey"
    And there is an hospital verification request from "Jack" for "Manuella" hospital
    Given "Will" is an admin for Cadwings
    When he is on the user sign in page
    When he fill in the following:
      | Email                 | admintest@cadwings.com |
      | Password              | Secretkey              |
    And he press "Log in"
    Then he should see "Signed in successfully."
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    Then he should see "Profile"
    When he follows "Profile"
    Then he should see "Dashboard"
    When he follows "Dashboard"
    Then he should see "ACTIVITIES BIO NOTIFICATIONS"
    When he follows "Notifications"
    Then he should see "Jack Requests Verification for Manuella Hospital."
    When he press "Verify"
    And he waits for 1 seconds
    And he confirms popup
    Then he should see "Hospital verification was successful."
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    And he follow "Log Out"
    Then he should see "Signed out successfully"
    When he waits for 5 seconds
    And "Jack" follow "Sign in"
    And he wait for 1 seconds
    Then he should be on the user sign in page
    When he fill in the following:
      | Email                 | manisiva19@gmail.com |
      | Password              | Secretkey            |
    And he press "Log in"
    Then he should see "Signed in successfully."
    When he waits for 5 seconds
    And he follows "menu-collapsible"
    When he follows "Profile"
    And he follows "Verify Hospital"
    Then he should see "All your hospitals has been verified, thanks"
    When he follow "menu-collapsible"
    Then he should see "Hospitals"
    When he follows "Hospitals"
    Then he should see "ALL MINE"
    When he follows "Mine"
    Then he should see "Manuella"