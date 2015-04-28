Feature: Log in Clavis Insight platform
  The login page verifies if the username and password are correct.

  @home-page @l1
  Scenario Outline: Log in
    Given I am on the Clavis login homepage
    When I type the userName "<username>"
    And I type the password "<password>"
    And I click the clavis log in button
    Then I am in the main page "<usernameLabel>"

  Examples:
    | username                              | password     | usernameLabel    |
    | barilla_us@clavistechnology.com       | Testing!5000 | Barilla US       |
    | general_mills_us@clavistechnology.com | Testing!2222 | General Mills US |



