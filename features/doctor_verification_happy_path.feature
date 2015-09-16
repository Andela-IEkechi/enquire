Feature: Manager gets one more doctor in his hospital
  As a manager, I need to let a doctor request verification
  So that I can accept the request
  So that the doctor could now have a verified_doctor's access

  @javascript
  Scenario: A new doctor requests verification, so that manager can accept and then he will be able to do as men does. ;)
    Given "Will" is a registered "manager" with email "willsiva19@gmail.com" and password "Secretkey"
    And "Will" has a verified hospital named "John Hopkins"
    And "Jack" is a registered "doctor" with email "jacksiva19@gmail.com" and password "Secretkey"
    When he is on the user sign in page
    And he fill in the following:
      | Email                 | jacksiva19@gmail.com |
      | Password              | Secretkey            |
    And he press "Log in"
    Then he should see "Signed in successfully."
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    Then he should see "Profile"
    When he follows "Profile"
    And he follows "Get Verified"
    Then he should see "Request Verification"
    When he press "Submit"
    And he waits for 2 seconds
    Then he should see "Message can't be blank"
    When he fill in "Message" with "Verify me, Dear hospital manager"
    And he press "Submit"
    And he waits for 2 seconds
    Then he should see "Doctor verification request was successfully created."
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    And he follow "Log Out"
    And he waits for 1 seconds
    Then he should see "Signed out successfully"
    When he waits for 5 seconds
    And "Will" follow "Sign in"
    And he wait for 1 seconds
    Then he should be on the user sign in page
    When he fill in the following:
      | Email                 | willsiva19@gmail.com |
      | Password              | Secretkey            |
    And he press "Log in"
    Then he should see "Signed in successfully."
    And he waits for 5 seconds
    And he follow "menu-collapsible"
    When he follows "Profile"
    When he follows "Dashboard"
    Then he should see "ACTIVITIES BIO NOTIFICATIONS"
    When he follows "Notifications"
    Then he should see "Jack Wants to be associated with John Hopkins Hospital."
    When he press "Verify"
    And he waits for 1 seconds
    And he confirms popup
    Then he should see "Doctor verification was successful."
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    And he follow "Log Out"
    Then he should see "Signed out successfully"
    When he waits for 5 seconds
    And "Jack" follow "Sign in"
    And he wait for 1 seconds
    Then he should be on the user sign in page
    When he fill in the following:
      | Email                 | jacksiva19@gmail.com |
      | Password              | Secretkey            |
    And he press "Log in"
    Then he should see "Signed in successfully."
    When he waits for 5 seconds
    And he follows "Dashboard"
    And he follows "Bio"
    Then he should see the image "verified.png"