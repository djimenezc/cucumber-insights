Feature: Search Scores Click Through
  Clicking through to the search scores page should yield consistent data

  @home-page
  Scenario: Setting the priority search terms toggle to on
    Given I log in to metadata
    And I configure search panels to be displayed for customer "General Mills US"
    When I log in Clavis homepage as "General Mills US"
    And I am in the main page "General Mills US"
    And I store the latest date score on the search scores panel
    And I click the search scores panel
    Then I should see the same score as the last value in the trend