Given(/^I am on the Google homepage$/) do
  puts 'Browsing to google'
  visit 'http://www.google.co.uk'
  page.save_screenshot('./reports/test.pdf')
end

Then(/^I will search for "(.*?)"$/) do |searchText|
  puts 'filling the search input field'
  fill_in 'gbqfq', :with => searchText
end

Then(/^I should see "(.*?)"$/) do |expectedText|
  puts 'Checking the search result'
  page.should have_content(expectedText)
  page.save_screenshot('./reports/test2.pdf')
end

Then(/^I will click the terms link$/) do
  puts 'Clicking the terms link'
  click_link('Terms')
end
