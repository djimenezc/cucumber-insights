Given(/^I am on the Google homepage$/) do
  puts 'Browsing to google'
  visit 'http://www.google.co.uk'

  # pending # express the regexp above with the code you wish you had
end

Then(/^I will search for "(.*?)"$/) do |searchText|
  puts 'filling the search input field'
  fill_in 'gbqfq', :with => searchText
end

Then(/^I should see "(.*?)"$/) do |expectedText|
  puts 'Checking the search result'
  page.should have_content(expectedText)
  # pending # express the regexp above with the code you wish you had
end

Then(/^I will click the terms link$/) do
  puts 'Clicking the terms link'
  click_link('Terms')
end
