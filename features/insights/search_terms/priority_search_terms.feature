Feature: Priority Search Terms Toggle
  Ensure the toggle is doing its job correctly

  @home-page @l2 @broken
  Scenario: Setting the priority search terms toggle to on
    Given I log in to metadata
    And I configure the priority search toggle to be on for customer "General Mills US"
    When I log in Clavis homepage as "General Mills US"
    And I am in the main page "General Mills US"
    And I go to the search scores page
    Then The priority terms toggle is set to priority terms

  @home-page @l2 @broken
  Scenario: Setting the priority search terms toggle to on
    Given I log in to metadata
    And I configure the priority search toggle to be off for customer "General Mills US"
    When I log in Clavis homepage as "General Mills US"
    And I am in the main page "General Mills US"
    And I go to the search scores page
    Then The priority terms toggle is set to all terms