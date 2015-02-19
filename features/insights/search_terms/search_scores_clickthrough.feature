Feature: Search Scores Click Through
  Clicking through to the search scores page should yield consistent data

  @do-thing-1
  Scenario: Search Score Click Through
    Given I log in Clavis homepage as "General Mills US"
    And I configure search panels to be displayed
    Then I am in the main page "General Mills US"
    Then I store the latest date score on the search scores panel
    Then I click the search scores panel
    Then I should see the same score as the last value in the trend