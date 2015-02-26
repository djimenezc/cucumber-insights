Feature: Verify executive dashboard panels links

  @portfolio-availability @l1
  Scenario: Verify that the score for the portfolio availability summary are correct
    Given I log in Clavis homepage as "KCC US"
    And I am in the main page "KCC US"
    And I am in the executive login page
    And Check panel scores of "portfolio_availability_panel" panel
    And Click "portfolio_availability_panel" panel
    Then Verify title is "Portfolio Availability"
    And Verify report score matches the scorecard score

  @portfolio-availability @l1
  Scenario: Verify portfolio availability summary, overtime panel
    Given I log in Clavis homepage as "KCC US"
    And I am in the main page "KCC US"
    And Click menu item "portfolio_availability_menu_item"
    And Click menu item "portfolio_availability_summary_menu_item"
    Then Verify title is "Portfolio Availability"
    And Verify overtime panel is displayed

