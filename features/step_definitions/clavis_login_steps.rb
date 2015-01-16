# Actions performed before each scenario
Before do |scenario|
  @clavis_home_page = @browser.create_clavis_login_page

  @browser.log.info('Instancing clavis login page')
end

Given(/^I am on the Clavis login homepage$/) do

  visit @clavis_home_page.url
end


When(/^I type the userName "(.*?)"$/) do |username|
  fill_in 'user_email', :with => username
end


When(/^I type the password "(.*?)"$/) do |password|
  fill_in 'user_password', :with => password
end


When(/^I click the clavis log in button$/) do
  encoded_img = @browser.driver.screenshot_as(:base64)
  embed("data:image/png;base64,#{encoded_img}",'image/png')
  click_button 'login'
end

Then(/^I am in the main page "(.*?)"$/) do |usernameLabel|
  encoded_img = @browser.driver.screenshot_as(:base64)
  embed("data:image/png;base64,#{encoded_img}",'image/png')
  page.should have_content(usernameLabel)
  page.should have_content('Clavis Insight')
end

Given(/^I login in Clavis homepage as KCC US$/) do

  # @clavis_home_page.open_clavis_home_page
  username = 'kcc_us@clavistechnology.com'
  password = 'Testing!700'

  visit @clavis_home_page.url
  fill_in 'user_email', :with => username
  fill_in 'user_password', :with => password
  click_button 'login'
end

Then(/^Navigation Menu is visible$/) do
  puts 'Verifying if the menu has few specific entries'

  page.should have_content('UPDATED Portfolio Availability')
  page.should have_content('Executive Dashboard')
  page.should have_content('Operations Dashboard')

  embed_image
end