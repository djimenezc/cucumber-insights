Feature: Find the GameSparks Website
  The Google homepage allows user to perform a search.

  Scenario: Search for the website
    Given I am on the Google homepage
    Then I will search for "GameSparks"
    Then I should see "Gamesparks"
    Then I will click the terms link