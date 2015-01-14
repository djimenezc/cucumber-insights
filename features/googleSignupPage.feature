Feature:  As a user, I want to check the validation of register google account

  Scenario Outline: Check validation of Google Sign Up page
    Given I'm on "https://accounts.google.com/SignUp" page
    When I input "<invalid value>" in "<field>"
    Then I should see "<error message>" in label "<field show error message>"
  Examples:
    | field                             | invalid value | field show error message            | error message               |
    | .//*[@id='GmailAddress']          |               | .//*[@id='errormsg_0_GmailAddress'] | You can't leave this empty. |
    | .//*[@id='GmailAddress']          | doiconon      | .//*[@id='errormsg_0_GmailAddress'] | Someone already has that username. Try another? |
    | .//*[@id='Passwd']                | 1234          | .//*[@id='errormsg_0_Passwd']       | Short passwords are easy to guess. Try one with at least 8 characters. |
