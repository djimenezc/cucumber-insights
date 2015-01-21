Given(/^I am on the Google homepage$/) do
  puts 'Browsing to google'
  visit 'http://www.google.co.uk'

  # noinspection RubyResolve
  encoded_img = @browser.driver.screenshot_as(:base64)
  embed("data:image/png;base64,#{encoded_img}",'image/png')
end

Then(/^I will search for "(.*?)"$/) do |searchText|
  puts 'filling the search input field'
  fill_in 'gbqfq', :with => searchText
end

Then(/^I should see "(.*?)"$/) do |expectedText|
  puts 'Checking the search result'
  # noinspection RubyResolve
  page.should have_content(expectedText)
  # noinspection RubyResolve
  encoded_img = @browser.driver.screenshot_as(:base64)
  embed("data:image/png;base64,#{encoded_img}",'image/png')
end

Then(/^I will click the terms link$/) do
  puts 'Clicking the terms link'
  click_link('Terms')
end
