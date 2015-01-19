Feature: Verify executive dashboard
  Verify if the left side navigation menu is rendered correctly.
  Verify if the datepicker component change the content display in the scorecards

  Scenario: Log in
    Given I log in Clavis homepage as KCC US
    Then I am in the main page "KCC US"
    Then Navigation Menu is visible

  Scenario: Changing the datepicker filter applied to the page
    Given I log in Clavis homepage as KCC US
    Given I am in the main page "KCC US"
    Given I am in the executive login page
    Then Change the filter date range to '2014-05-01' from '2014-05-01'
    Then Open dimension filter picker