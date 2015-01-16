Given(/^I am on the Clavis login homepage$/) do
  @clavis_home_page = @browser.open_clavis

  visit @clavis_home_page.url
end


When(/^I type the userName "(.*?)"$/) do |username|
  fill_in 'user_email', :with => username
end


When(/^I type the password "(.*?)"$/) do |password|
  fill_in 'user_password', :with => password
end


When(/^I click the clavis log in button$/) do
  page.save_screenshot('./reports/clavisLoginPage.png')
  click_button 'login'
end

Then(/^I am in the main page "(.*?)"$/) do |usernameLabel|
  page.save_screenshot('./reports/mainPage.png')
  page.should have_content(usernameLabel)
  page.should have_content('Clavis Insight')
end
