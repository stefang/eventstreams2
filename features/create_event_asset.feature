Feature: Create event image asset
  In order to setup a new asset
  A user
  Should be able to sign in and create a new assets in an existing event

  Scenario: User creates a published speaker successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" event "mytrack" track has a published talk called "mytalk"
    When I go to the events page
    And I follow "Manage"
    And I follow "Image Assets"
    And I follow "New Asset"
    Then I fill in "Title" with "Asset Name"
    And I attach the file "test.png" to "Image asset (Less than 1mb)"
    And I press "Save"
    Then I should see "Successfully created event asset."
    And I should see "Asset Name"
   
  Scenario: User edits an asset successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" event "mytrack" track has a published talk called "mytalk"
    When I go to the events page
    And I follow "Manage"
    And I follow "Image Assets"
    And I follow "New Asset"
    Then I fill in "Title" with "Asset Name"
    And I attach the file "test.png" to "Image asset (Less than 1mb)"
    And I press "Save"
    Then I should see "Successfully created event asset."
    And I should see "Asset Name"
    Then I follow "Edit"
    And I fill in "Title" with "New Asset Name"
    And I press "Save"
    Then I should see "Successfully updated event asset."
    And I should see "New Asset Name"
    
  Scenario: User deletes an asset successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" event "mytrack" track has a published talk called "mytalk"
    When I go to the events page
    And I follow "Manage"
    And I follow "Image Assets"
    And I follow "New Asset"
    Then I fill in "Title" with "Asset Name"
    And I attach the file "test.png" to "Image asset (Less than 1mb)"
    And I press "Save"
    Then I should see "Successfully created event asset."
    And I should see "Asset Name"
    Then I follow "Delete"
    Then I should see "Successfully deleted event asset."
    And I should not see "Asset Name"
    
