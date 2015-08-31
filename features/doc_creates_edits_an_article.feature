Feature: Doc creates and edits an article
  As a registered doctor on Cadwings
  So as to support the mission of easy health education
  I have to create articles for the consumption of our clients

  @javascript
  Scenario: Doc creates and edits an article
    Given "Jack" is a registered "doctor" with email "jacksiva19@gmail.com" and password "Secretkey"
    And Jack is a verified doctor
    When he is on the user sign in page
    And he fill in the following:
      | Email                 | jacksiva19@gmail.com |
      | Password              | Secretkey            |
    And he press "Log in"
    When he waits for 5 seconds
    And he follow "menu-collapsible"
    And he follows "Articles"
    Then he should see "NEW ARTICLE"
#    When he follow "New Article"
#    And he wait for 1 seconds
#    Then he should be on the new article page
#    When he fill in "Title" with "Reducing belly fat"
#    And he fill in "content" with "The average man's body houses 43.2 pounds of fat. And at any one moment, that number is either increasing or decreasing—it's never stagnant. Spend more of each day burning fat than you do storing it, and over time, you'll bury your belly forever. Sound simple? It is. You see, there's no single secret formula for losing fat. In fact, find 100 successful losers and they'll give you 100 different ways to win the battle of the bulge. But we did them one better. On the following pages, you'll find 101 tips designed to help you lose your love handles, bust your gut, and define your abs. Simply incorporate three or four into your life every day, and you'll finish off your fat easier and faster than you ever imagined possible."
#    And he press "Save"
#    Then he should see "Article successfully posted."