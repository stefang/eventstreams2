Feature: Create talk
  In order to setup a new talk
  A user
  Should be able to sign in and create a new talks in an existing event

  Scenario: User creates a published talk successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" has a venue called "posh_hotel"
    And "myevent" has a programme menu item
    When I go to the events page
    And I follow "Manage"
    And I follow "Talks"
    And I follow "New Talk"
    Then I fill in "Title" with "My Talk"
    And I fill in "Description" with "My talk will be cool"
    And I check "Show"
    And I select "mytrack" from "Track"
    And I select "posh_hotel" from "Venue"
    And I press "Save"
    Then I should see "Successfully created talk."
    And I should see "My Talk"
    And I go to the myevent programme page
    Then I should see "My Talk"

  @wip
  Scenario: User creates a talk with speakers but no title
    Given I am a new, authenticated user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" has a venue called "posh_hotel"
    And "myevent" has a programme menu item
    And "myevent" has a published speaker called "Bob"
    And "myevent" has a published speaker called "Jim"
    And "myevent" has an upublished speaker called "Tim"
    When I go to the events page
    And I follow "Manage"
    And I follow "Talks"
    And I follow "New Talk"
    Then I check "Tim"
    And I check "Bob"
    And I check "Jim"
    And I fill in "Description" with "My talk will be cool"
    And I check "Show"
    And I select "mytrack" from "Track"
    And I select "posh_hotel" from "Venue"
    And I press "Save"
    Then I should see "Successfully created talk."
    And I should see "Bob and Jim"
    And I go to the myevent programme page
    Then I should see "Bob and Jim"

  Scenario: User creates an unpublished talk successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" has a programme menu item
    When I go to the events page
    And I follow "Manage"
    And I follow "Talks"
    And I follow "New Talk"
    Then I fill in "Title" with "My Talk"
    And I fill in "Description" with "My talk will be cool"
    And I check "Show"
    And I select "mytrack" from "Track"
    And I press "Save"
    Then I should see "Successfully created talk."
    And I should see "My Talk"
    And I follow "New Talk"
    Then I fill in "Title" with "My Other Talk"
    And I fill in "Description" with "My talk will be cool"
    And I select "mytrack" from "Track"
    And I press "Save"
    Then I should see "Successfully created talk."
    And I should see "My Other Talk"
    And I go to the myevent programme page
    Then I should not see "My Other Talk"

  Scenario: User edits a published talk successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" has a venue called "posh_hotel"
    And "myevent" has a programme menu item
    When I go to the events page
    And I follow "Manage"
    And I follow "Talks"
    And I follow "New Talk"
    Then I fill in "Title" with "My Talk"
    And I fill in "Description" with "My talk will be cool"
    And I check "Show"
    And I select "mytrack" from "Track"
    And I select "posh_hotel" from "Venue"
    And I press "Save"
    Then I should see "Successfully created talk."
    And I should see "My Talk"
    And I follow "Edit"
    Then I fill in "Title" with "My Talk Is Awesome"
    And I press "Save"
    Then I should see "Successfully updated talk."
    And I should see "My Talk Is Awesome"

  Scenario: User deletes a published talk successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" has a venue called "posh_hotel"
    And "myevent" has a programme menu item
    When I go to the events page
    And I follow "Manage"
    And I follow "Talks"
    And I follow "New Talk"
    Then I fill in "Title" with "My Talk"
    And I fill in "Description" with "My talk will be cool"
    And I check "Show"
    And I select "mytrack" from "Track"
    And I select "posh_hotel" from "Venue"
    And I press "Save"
    Then I should see "Successfully created talk."
    And I should see "My Talk"
    And I follow "Delete"
    Then I should see "Successfully deleted talk."
    And I should not see "My Talk"

