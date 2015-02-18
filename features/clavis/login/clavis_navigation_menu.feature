Feature: Verify executive dashboard
  Verify if the left side navigation menu is rendered correctly.
  Verify if the datepicker component change the content display in the scorecards

  @do-thing-1
  Scenario: Log in
    Given I log in Clavis homepage as KCC US 2
    Then Navigation Menu is visible

  @do-thing-1
  Scenario: Changing the datepicker filter applied to the page
    Given I log in Clavis homepage as "KCC US"
    And I am in the main page "KCC US"
    And I am in the executive login page
    And Date picker date label is correct
    Then Change the filter date range to '2014-05-01' from '2014-05-01'
    And Verify that the date picker filter is applied
    And Open dimension filter picker
    And Uncheck categories