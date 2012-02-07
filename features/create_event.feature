Feature: Create event
  In order to setup a new event
  As a user
  I want be able to sign in and create a new event

  Scenario: User creates and publishes an event successfully
    Given I am a new, authenticated user
    When I follow "Your Events"
    Then I follow "New Event"
    Then I should see "Title"
    When I fill in "Title" with "My Event"
    And I fill in "Subdomain" with "myevent"
    And I attach the file "test.png" to "Event Logo (Resized to fit in 210px x 90px)"
    And I press "Save"
    Then I should see "Successfully created event"
    And I should be on my admin events index page
    Then I should see "My Event"
    Then I follow "Manage"
    And I check "Show"
    And I press "Save"
    When I go to the myevent subdomain
    Then I should see "My Event"
    And I should see "Powered by Eventstreams"
    And I should not see "This event is currently hidden"

  Scenario: User creates and hides an event successfully
    Given I am a new, authenticated user
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with "My Event"
    And I fill in "Subdomain" with "myevent"
    And I press "Save"
    Then I should see "Successfully created event"
    Then I should see "My Event"
    When I go to the myevent subdomain
    Then I should see "My Event"
    And I should see "Powered by Eventstreams"
    And I should see "Event Hidden"
  
  Scenario: User creates event unsuccessfully
    Given I am a new, authenticated user
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with ""
    And I press "Save"
    Then I should see "Title can't be blank"
    When I fill in "Title" with "Title"
    And I press "Save"
    Then I should see "Subdomain can't be blank"
      
  Scenario: User tries to create an event with a subdomain that already exists and is owned by someone else
    Given I am a new, authenticated user
    And an event exists called "myevent"
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with "Exciting Event"
    And I fill in "Subdomain" with "myevent"
    And I press "Save"
    Then I should see "Someone has already bagged this subdomain, sorry!"
  
  Scenario: User tries to create an event with a subdomain that already exists and is owned by themselves
    Given I am a new, authenticated user
    And I have an event called "myevent"
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with "Exciting Event"
    And I fill in "Subdomain" with "myevent"
    And I press "Save"
    Then I should see "Successfully created event"
    Then I should see "Exciting Event"
  
  Scenario: User tries to create an event with a subdomain with non alphanumeric characters
    Given I am a new, authenticated user
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with "Exciting Event"
    And I fill in "Subdomain" with "@./"
    And I press "Save"
    Then I should see "Subdomain must only contain letters and numbers"

  Scenario: User tries to create an event with a url links without http at the beginning
    Given I am a new, authenticated user
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with "Exciting Event"
    And I fill in "Subdomain" with "myevent"
    And I fill in "event_facebook_url" with "facebook.com?group_id=123"
    And I fill in "event_booking_url" with "eventbrite.com?event_id=123"
    And I press "Save"
    And I follow "Manage"
    Then the "event_facebook_url" field should contain "http://facebook.com"
    And the "event_booking_url" field should contain "http://eventbrite.com"
    
  Scenario: User tries to create an event with a subdomain that is reserved
    Given I am a new, authenticated user
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with "Exciting Event"
    And I fill in "Subdomain" with "www"
    And I press "Save"
    Then I should see "Subdomain 'www' is reserved"
    And I fill in "Subdomain" with "about"
    And I press "Save"
    Then I should see "Subdomain 'about' is reserved"
    And I fill in "Subdomain" with "contact"
    And I press "Save"
    Then I should see "Subdomain 'contact' is reserved"
    And I fill in "Subdomain" with "faq"
    And I press "Save"
    Then I should see "Subdomain 'faq' is reserved"
    And I fill in "Subdomain" with "blog"
    And I press "Save"
    Then I should see "Subdomain 'blog' is reserved"
    And I fill in "Subdomain" with "tour"
    And I press "Save"
    Then I should see "Subdomain 'tour' is reserved"
    And I fill in "Subdomain" with "features"
    And I press "Save"
    Then I should see "Subdomain 'features' is reserved"
    And I fill in "Subdomain" with "packages"
    And I press "Save"
    Then I should see "Subdomain 'packages' is reserved"
    And I fill in "Subdomain" with "tos"
    And I press "Save"
    Then I should see "Subdomain 'tos' is reserved"
    And I fill in "Subdomain" with "privacy"
    And I press "Save"
    Then I should see "Subdomain 'privacy' is reserved"
    And I fill in "Subdomain" with "help"
    And I press "Save"
    Then I should see "Subdomain 'help' is reserved"
    And I fill in "Subdomain" with "support"
    And I press "Save"
    Then I should see "Subdomain 'support' is reserved"
    And I fill in "Subdomain" with "pricing"
    And I press "Save"
    Then I should see "Subdomain 'pricing' is reserved"
    And I fill in "Subdomain" with "careers"
    And I press "Save"
    Then I should see "Subdomain 'careers' is reserved"
  
