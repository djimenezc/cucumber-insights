Feature: Verify executive dashboard
  Verify if the left side navigation menu is rendered correctly.
  Verify if the datepicker component change the content display in the scorecards

#  @home-page @l1
#  Scenario: Verify menu is visible
#    Given I log in Clavis homepage as KCC US 2
#    Then Navigation Menu is visible
#
#  @home-page @l1
#  Scenario: Verify that all the links in the menu display a report with no issue
#    Given I log in Clavis homepage as KCC US 2
#    Then Click menu item "executive_menu_item"
#    And Verify title is "Executive Dashboard"
#    And Click menu item "operations_menu_item"
#    And Verify title is "Operations Dashboard"
#    And Click menu item "portfolio_availability_menu_item"
#    And Click menu item "portfolio_availability_summary_menu_item"
#    And Verify title is "Portfolio Availability"
#    And Click menu item "portfolio_availability_products_not_listed_menu_item"
#    And Verify title is "Portfolio Availability"
#    And Verify subTitle is "Products Not Listed"
#    And Click menu item "portfolio_menu_item"
#    And Verify title is "Portfolio Analysis"
#    And Verify subTitle is "Overview"
#    And Click menu item "price_menu_item"
#    And Click menu item "price_summary_menu_item"
#    And Verify title is "Price"
#    And Verify subTitle is "Summary"
#    And Click menu item "price_exceptions_menu_item"
#    And Verify title is "Price"
#    And Verify subTitle is "Exceptions"
#    And Click menu item "ratings_and_reviews_menu_item"
#    And Verify title is "Ratings And Reviews"
#    And Click menu item "search_ranking_menu_item"
#    And Click menu item "search_ranking_management_menu_item"
#    And Verify title is "Search Rankings"
#    And Verify subTitle is "Search Scores"
#    And Click menu item "search_ranking_detailed_menu_item"
#    And Verify title is "Search Rankings"
#    And Verify subTitle is "Share Of Search"
#    And Click menu item "menu_paths_menu_item"
#    And Verify title is "Menu Placement"
#    And Verify subTitle is "Summary"
#    And Click menu item "geo_menu_item"
#    And Verify title is "Geo"
#    And Verify subTitle is "Map Dashboard"
#    And Click menu item "imaging_menu_item"
#    And Verify title is "Image Accuracy"
#    And Verify subTitle is "Comparison Overview"

  @home-page @l2
  Scenario: Changing the datepicker filter applied to the page
    Given I log in Clavis homepage as "KCC US"
    And I am in the main page "KCC US"
    And I am in the executive login page
    And Date picker date label is correct
    Then Change date filter to select last 3 months
    And Verify that the date picker filter is applied
    And Open dimension filter picker
    And Uncheck categories