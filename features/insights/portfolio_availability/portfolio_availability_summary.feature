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
    And Click over the overtime legend buttons

  @portfolio-availability @l1
  Scenario: Verify portfolio availability summary by Online Store panel
    Given I log in Clavis homepage as "KCC US"
    And I am in the main page "KCC US"
    And Click menu item "portfolio_availability_menu_item"
    And Click menu item "portfolio_availability_summary_menu_item"
    And Change the filter date range to '2015-01-29' from '2015-02-26'
    Then Verify panel by online store is displayed
    And Click over the legend buttons in the panel by Online Store
    And Mouse over the bar "0" in the panel by Online Store
    And Display product count of bar "0" in the overtime panel
    And Mouse over the bar "1" in the panel by Online Store
    And Display product count of bar "1" in the overtime panel

  @portfolio-availability @l1
  Scenario: Drill down to analysis online_store report
    Given I log in Clavis homepage as "KCC US"
    And I am in the main page "KCC US"
    And Click menu item "portfolio_availability_menu_item"
    And Click menu item "portfolio_availability_summary_menu_item"
    And Change the filter date range to '2015-01-29' from '2015-02-26'
    Then Verify panel by online store is displayed
    And Mouse over the bar "0" in the panel by Online Store
    And Check the chart column label "0" position match with the tooltip title
    And Drill down to the Online Store Analysis report
    And Verify title is "Portfolio Availability"
    And Verify subTitle is "Detail"
    And Verify the filter summary matches with the online store "0" in portfolio availability chart

