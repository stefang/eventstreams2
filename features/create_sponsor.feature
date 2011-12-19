Feature: Create sponsor record
  In order to setup a new sponsor
  A user
  Should be able to sign in and create a new sponsor in an existing event

  Scenario: User creates sponsor successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Sponsors"
    And I follow "New Sponsor"
    Then I fill in "Name" with "Glaxo"
    And I fill in "Url" with "glaxo.com"    
    And I attach the file "test.png" to "Sponsor's Logo (Resized to fit in 210px x 90px)"
    And I press "Save"
    Then I should see "Successfully created sponsor."
    And I should see "Glaxo"
    And I should see "http://glaxo.com"

  Scenario: User creates sponsor unsuccessfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Sponsors"
    And I follow "New Sponsor"
    And I press "Save"
    Then I should see "Name can't be blank"
    Then I should see "Url can't be blank"

  Scenario: User edits sponsor successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Sponsors"
    And I follow "New Sponsor"
    Then I fill in "Name" with "Glaxo"
    And I fill in "Url" with "glaxo.com"    
    And I press "Save"
    Then I should see "Successfully created sponsor."
    And I should see "Glaxo"
    And I should see "http://glaxo.com"
    Then I follow "Edit"
    Then I fill in "Name" with "Glaxo Wellcome"
    And I press "Save"
    Then I should see "Glaxo Wellcome"
    And I should see "http://glaxo.com"

  Scenario: User deletes sponsor successfully
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I go to my user events index page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Sponsors"
    And I follow "New Sponsor"
    Then I fill in "Name" with "Glaxo"
    And I fill in "Url" with "glaxo.com"    
    And I press "Save"
    Then I should see "Successfully created sponsor."
    And I follow "Delete"
    Then I should see "Successfully deleted sponsor."
    And I should not see "Glaxo"