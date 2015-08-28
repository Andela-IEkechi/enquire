Feature: Manager manages Hospital
  As an already registered manager
  I need to login and create an hospital
  So that I can request for verification and I will be able to edit the hospital info too


  @javascript
  Scenario: Non-manager tries to create an hospital
    Given "Jack" is a registered "user" with email "myuser@example.com" and password "secretpass"
    And "Jack" is logged in with password "secretpass"
    And I wait for 2 seconds
    When he go to the add new hospital page
    Then he should see "You are not authorized to access this page."
    And he should be on the home page

  @javascript
  Scenario: A Manager tries to create an hospital (with valid params), and then request for verification
    Given There is an admin for Cadwings
    And "Jack" is a registered "manager" with email "the_manager@example.com" and password "secretpass"
    And "Jack" is logged in with password "secretpass"
    And I wait for 1 seconds
    When he go to the add new hospital page
    Then he should be on the add new hospital page
    When he fill in the following:
      | Name         | John Hopkins                                                               |
      | Description  | The Johns Hopkins University is a private research university in Baltimore |
      | Address      | Baltimore, MD 21218, United States                                         |
      | Phone number | 33445566                                                                   |
    And he press "Submit"
    Then he should see "Hospital was successfully created."
    And he waits for 5 seconds
    When he follows "menu-collapsible"
    Then he should see "Profile"
    When he follows "Profile"
    Then he should see "Verify Hospital"
    When he follows "Verify Hospital"
    Then he should see "Request Hospital Verification"
    When he fill in "Message" with "Verify me, Dear Cadwings Admin"
    And he press "Submit"
    Then he should see "Hospital verification request was successfully created."
    And he should be on the dashboard page

  @javascript
  Scenario: A Manager tries to create an hospital (with invalid params)
    Given "Jack" is a registered "manager" with email "the_manager@example.com" and password "secretpass"
    And "Jack" is logged in with password "secretpass"
    And I wait for 1 seconds
    When he go to the add new hospital page
    Then he should be on the add new hospital page
    And he press "Submit"
    Then he should see "errors prohibited this hospital from being saved"

  @javascript
  Scenario: A Manager edits his already created hospital, and then deletes it
    Given "Jack" is a registered "manager" with email "the_manager@example.com" and password "secretpass"
    And "Jack" has a verified hospital named "Inetia"
    And "Jack" is logged in with password "secretpass"
    And he wait for 1 seconds
    When he goes to the hospitals page
    Then he should see "Hospitals"
    And he should see "ALL"
    And he should see "MINE"
    And he should not see "EDIT"
    And he should not see "REMOVE"
    When he follows "Mine"
    Then he should see "EDIT"
    And he should see "REMOVE"
    When he follows "Edit"
    Then he should see "Editing Hospital"
    When he fill in the following:
      | Name         | John Hopkins                                                               |
      | Description  | The Johns Hopkins University is a private research university in Baltimore |
      | Address      | Baltimore, MD 21218, United States                                         |
      | Phone number | 33445566                                                                   |
    And he press "Submit"
    Then he should see "Hospital was successfully updated."
    And he should see "John Hopkins"
    When he goes to the hospitals page
    When he follows "Mine"
    When he follows "Remove"
    And he waits for 1 seconds
    And he confirms popup
    Then he should see "Hospital was successfully destroyed."
    And he should not see "John Hopkins"