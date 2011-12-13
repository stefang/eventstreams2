Feature: Create event venue
  In order to setup a new event venue
  A user
  Should be able to sign in and create a new event venue in an existing event

  Scenario: User creates initial venue successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Locations"
    And I follow "New Location"
    Then I fill in "Name" with "Nice Hotel"
    And I fill in "Postcode" with "W1K 1BE"
    And I check "Show"
    And I press "Save"
    Then I should see "Successfully created venue."
    And I should see "Nice Hotel"
     
  Scenario: User creates initial venue unsuccessfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Locations"
    And I follow "New Location"
    And I check "Show"
    And I press "Save"
    Then I should see "Name can't be blank"
    Then I should see "Postcode can't be blank"
    
  Scenario: User edits venue successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Locations"
    And I follow "New Location"
    Then I fill in "Name" with "Nice Hotel"
    And I fill in "Postcode" with "W1K 1BE"
    And I check "Show"
    And I press "Save"
    Then I should see "Successfully created venue."
    And I should see "Nice Hotel"
    Then I follow "Edit"
    Then I fill in "Name" with "Nasty Hotel"
    And I press "Save"
    Then I should see "Nasty Hotel"

  Scenario: User deletes venue successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Locations"
    And I follow "New Location"
    Then I fill in "Name" with "Nice Hotel"
    And I fill in "Postcode" with "W1K 1BE"
    And I check "Show"
    And I press "Save"
    Then I should see "Successfully created venue."
    And I should see "Nice Hotel"
    And I follow "Delete"
    Then I should see "Successfully destroyed venue."
