Given(/^I am on the Clavis login homepage$/) do
  @clavis_home_page = @browser.open_clavis

  visit @clavis_home_page.url
end


Then(/^I will type the userName "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end


Then(/^I will type the password "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end


Then(/^I will click the clavis log in button$/) do
  pending # express the regexp above with the code you wish you had
end