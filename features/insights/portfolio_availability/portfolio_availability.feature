Feature: Verify executive dashboard panels links

  @portfolio-availability @l1
  Scenario: Click through all the panels displayed in the executive dashboard report
    Given I log in Clavis homepage as "KCC US"
    And I am in the main page "KCC US"
    And I am in the executive login page
    And Check panel scores of "portfolio_availability_panel" panel
    And Click "portfolio_availability_panel" panel
    Then Verify title is "Portfolio Availability"
    And Verify report score matches the scorecard score

