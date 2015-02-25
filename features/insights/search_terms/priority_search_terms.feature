Feature: Priority Search Terms Toggle
  Ensure the toggle is doing its job correctly

  @do-thing-1 @l2
  Scenario: Setting the priority search terms toggle to on
    Given I log in Clavis homepage as "General Mills US"
    And I am in the main page "General Mills US"
    And I configure the priority search toggle to be on by default
    And I go to the search scores page
    Then The priority terms toggle is set to priority terms

#  @do-thing-1 @l2
#  Scenario: Setting the priority search terms toggle to off
#    Given I log in Clavis homepage as "General Mills US"
#    And I am in the main page "General Mills US"
#    And I configure the priority search toggle to be off by default
#    And I go to the search scores page
#    Then The priority terms toggle is set to all terms
#
#  @do-thing-1 @l2
#  Scenario: Clicking the priority search toggle works
#    Given I log in Clavis homepage as "General Mills US"
#    And I am in the main page "General Mills US"
#    And I configure the priority search toggle to be on by default
#    And I go to the search scores page
#    And I click the priority search terms toggle to be all terms
#    Then The priority terms toggle is set to all terms