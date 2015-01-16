Feature: Login in Clavis Insight platform
  The login page verify if the username and password are correct.

  Scenario Outline: Login in the app
    Given I am on the Clavis login homepage
    And I will type the userName "<username>"
    And I will type the password "<password>"
    When I will click the clavis log in button
    Then Verify I am in the main page "<usernameLabel>"

  Examples:
  | username                              | password       | usernameLabel    |
  | kcc_us@clavistechnology.com           | Testing!700    | KCC US           |
  | general_mills_us@clavistechnology.com | Testing!500    | General Mills US |