Feature: Verify navigation menu
  Verify if the left side navigation menu is rendered correctly.

  Scenario: Login in the app
    Given I login in Clavis homepage as KCC US
    Then I am in the main page "KCC US"
    Then Navigation Menu is visible