Feature: Exec Dash Search Panels
  The exec dash should display search panels when configured in metadata

  @home-page
  Scenario: Search Panels Displayed
    Given I log in to metadata
    And I configure search panels to be displayed for customer "KCC US"
    When I log in Clavis homepage as "KCC US"
    And I am in the main page "KCC US"
    And I go to the exec dash
    Then I should see the search panels

  @home-page
  Scenario: Search Panels Displayed
    Given I log in to metadata
    And I configure search panels to be hidden for customer "KCC US"
    When I log in Clavis homepage as "KCC US"
    And I am in the main page "KCC US"
    And I go to the exec dash
    Then I should not see the search panels
