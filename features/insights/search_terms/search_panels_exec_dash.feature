Feature: Exec Dash Search Panels
  The exec dash should display search panels when configured in metadata

  @do-thing-1
  Scenario: Search Panels Displayed
    Given I log in to metadata
    And I configure search panels to be displayed
    When I log in Clavis homepage as "General Mills US"
    And I am in the main page "General Mills US"
    And I configure search panels to be displayed
    And I go to the exec dash
    Then I should see the search panels

#  @do-thing-1
#  Scenario: Search Panels Hidden
#    Given I log in Clavis homepage as "General Mills US"
#    And I am in the main page "General Mills US"
#    And I configure search panels to be hidden
#    And I go to the exec dash
#    Then I should not see the search panels
