Feature: Login in Clavis Insight platform
  The login page verify if the username and password are correct.

  Scenario: Login in the app
    Given I am on the Clavis login homepage
    Then I will type the userName "kcc_us@clavistechnology.com"
    Then I will type the password "Testing!700"
    Then I will click the clavis log in button