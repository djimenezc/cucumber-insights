Feature: Remember the page size selected
  It should be remember the user preference across reports and sessions
  The All options should not be remembered

  @common-features @l2
  Scenario: Log in and check the page size is set to 10 by default.
    Given I log in Clavis homepage as "BARILLA US"
    And Click menu item "portfolio_availability_menu_item"
    And Click menu item "portfolio_availability_exceptions_menu_item"
    And Verify title is "Portfolio Availability"
    And Verify subTitle is "Exceptions"
    When Data is loaded
    And Dropdown: Verify selected page size is "10"
    And Dropdown: Verify the table displays "10" rows
    Then I click page size button
    And Dropdown: Click "20" button
    And Dropdown: Verify selected page size is "20"
    And Dropdown: Verify the table displays "20" rows


