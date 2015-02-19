Feature: Verify executive dashboard panels links

  @do-thing-1
  Scenario: Click through all the panels displayed in the executive dashboard report
    Given I log in Clavis homepage as "KCC US"
    And I am in the main page "KCC US"
    And I am in the executive login page
    Then Verify all the executive panels are displayed
    And Click "portfolio_availability_panel" panel
    And Verify title is "Portfolio Availability"
    And Verify subTitle is "Summary"
    And Back to the previous page
    And I am in the executive login page
    Then Verify all the executive panels are displayed
    And Click "imaging_panel" panel
    And Verify title is "Image Accuracy"
    And Verify subTitle is "Comparison Overview"
    And Back to the previous page
    And I am in the executive login page
    Then Verify all the executive panels are displayed
    And Click "ratings_and_reviews_panel" panel
    And Verify title is "Ratings And Reviews"
    And Verify subTitle is not displayed
    And Back to the previous page
    And I am in the executive login page
    Then Verify all the executive panels are displayed
    And Click "price_management_panel" panel
    And Verify title is "Price"
    And Verify subTitle is "Summary"
    And Back to the previous page
    And I am in the executive login page
    Then Verify all the executive panels are displayed
    And Click "menu_panel" panel
    And Verify title is "Menu Placement"
    And Verify subTitle is "Summary"
    And Back to the previous page