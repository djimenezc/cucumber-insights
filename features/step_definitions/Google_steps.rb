Given(/^I am on the Google homepage$/) do
  puts 'hello I am browsing to google'
  visit 'http://www.google.co.uk'

  # pending # express the regexp above with the code you wish you had
end

Then(/^I will search for "(.*?)"$/) do |searchText|
  fill_in 'gbqfq', :with => searchText
end

Then(/^I should see "(.*?)"$/) do |expectedText|

  page.should have_content(expectedText)
  # pending # express the regexp above with the code you wish you had
end

Then(/^I will click the terms link$/) do
  click_link('Terms')
end
