Feature: Create link
  In order to setup a new menu link to external site
  A user
  Should be able to sign in and create a new link to an external website

  Scenario: User creates blog link successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Pages & Links"
    And I follow "New Link"
    Then I fill in "Title" with "Blog"
    And I fill in "Url" with "http://test.com"
    And I press "Save"
    Then I should see "Successfully created link."
    And I should see "Blog"

  Scenario: User creates blog link unsuccessfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Pages & Links"
    And I follow "New Link"
    And I press "Save"
    Then I should see "Title can't be blank"
    Then I should see "Url can't be blank"
  
  Scenario: User edits blog link unsuccessfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Pages & Links"
    And I follow "New Link"
    Then I fill in "Title" with "Blog"
    And I fill in "Url" with "http://test.com"
    And I press "Save"
    Then I should see "Successfully created link."
    And I should see "Blog"
    Then I follow "Edit"
    Then I fill in "Title" with "Bloggage"
    And I press "Save"
    And I should see "Bloggage"

  Scenario: User deleted blog link successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Pages & Links"
    And I follow "New Link"
    Then I fill in "Title" with "Blog"
    And I fill in "Url" with "http://test.com"
    And I press "Save"
    Then I should see "Successfully created link."
    And I should see "Blog"
    And I follow "Delete"
    Then I should see "Successfully deleted link."
    And I should not see "Blog"
