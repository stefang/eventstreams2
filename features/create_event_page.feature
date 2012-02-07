Feature: Create event page
  In order to setup a new event page
  A user
  Should be able to sign in and create a new event page in an existing event

  Scenario: User creates welcome page successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my admin events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Pages & Links"
    And I follow "New Page"
    Then I fill in "Title" with "Welcome"
    And I press "Save"
    Then I should see "Successfully created event page."
    And I should see "Welcome"

  Scenario: User creates welcome page un successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my admin events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Pages & Links"
    And I follow "New Page"
    And I press "Save"
    Then I should see "Title can't be blank"
    
  Scenario: User edits welcome page successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my admin events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Pages & Links"
    And I follow "New Page"
    Then I fill in "Title" with "Welcome"
    And I press "Save"
    Then I should see "Successfully created event page."
    And I should see "Welcome"
    And I should see "welcome"
    Then I follow "Edit"
    Then I fill in "Title" with "Welcome To My Awesome Event"
    And I press "Save"
    Then I should see "Welcome To My Awesome Event"
    And I should see "welcome-to-my-awesome-event"

  Scenario: User deletes welcome page successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my admin events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Pages & Links"
    And I follow "New Page"
    Then I fill in "Title" with "Welcome"
    And I press "Save"
    Then I should see "Successfully created event page."
    And I should see "Welcome"
    And I follow "Delete"
    Then I should see "Successfully deleted event page."
    And I should not see "Welcome"
    