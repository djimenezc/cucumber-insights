Feature: Login in Clavis Insight platform
  The login page verify if the username and password are correct.

  Scenario Outline: Login in the app
    Given I am on the Clavis login homepage
    When I type the userName "<username>"
    And I type the password "<password>"
    And I click the clavis log in button
    Then I am in the main page "<usernameLabel>"

  Examples:
  | username                              | password       | usernameLabel    |
  | kcc_us@clavistechnology.com           | Testing!700    | KCC US           |
  | general_mills_us@clavistechnology.com | Testing!500    | General Mills US |