Feature: Create event track
  In order to setup a new event track
  A user
  Should be able to sign in and create a new event tracks in an existing event

  Scenario: User creates initial track successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Tracks"
    And I follow "New Track"
    Then I fill in "Title" with "My Track"
    And I check "Show"
    And I press "Save"
    Then I should see "Successfully created track."
    And I should see "My Track"

  Scenario: User views initial published track
    Given I am a new, authenticated user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Tracks"
    And I should see "mytrack"
  
  Scenario: User views initial track
    Given I am a new, authenticated user
    And I have an event called "myevent"
    And "myevent" has an unpublished track called "mytrack"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Tracks"
    And I should see "mytrack"