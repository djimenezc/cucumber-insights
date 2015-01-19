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
  embed_image
  click_button 'login'
end

Then(/^I am in the main page "(.*?)"$/) do |usernameLabel|
  embed_image
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

  embed_image

  page.should have_content('Portfolio Availability')
  page.should have_content('Executive Dashboard')
  page.should have_content('Operations Dashboard')

  page.should have_selector('#pageTitle', :text => 'Executive Dashboard')
  embed_image
  page.should have_selector('tspan', :text => 'Dec 25')
  embed_image 'Before page is loaded completely'
end

Then(/^Change the filter date range to '(\d+)\-(\d+)\-(\d+)' from '(\d+)\-(\d+)\-(\d+)'$/) do |toYear, toMonth, toDay, fromYear, fromMonth, fromDay|

  visit "#{@clavis_home_page.url}#executive"

  puts "Change the filter date range to #{toYear}-#{toMonth}-#{toDay} from #{fromYear}-#{fromMonth}-#{fromDay}"

  month_array = Date::MONTHNAMES.slice(1,12)
  previous_month = Date.today.mon - 2
  previous_month_year = Date.today.mon - 2 > 0 ? Date.today.year : Date.today.year - 1
  current_month = Date.today.mon - 1
  next_month_year = Date.today.mon != 12 ? Date.today.year : Date.today.year + 1

  puts "current date #{month_array[current_month]}, #{Date.today.year}"

  page.should have_css('#loading')
  wait_for_ajax 10
  page.should have_no_css('#loading')
  expect(page).to have_css('.date-range-field > span', text: '22nd Dec, 2014 - 19th Jan, 2015')
  page.first('.date-range-field').click

  page.should have_content("#{month_array[previous_month]}, #{previous_month_year}")
  page.should have_content("#{month_array[current_month]}, #{Date.today.year}")
  page.should have_content("#{month_array[Date.today.mon]}, #{next_month_year}")

  embed_image 'After date picker is clicked'

  # page.last('.datepickerSaturday.datepickerSelected.selectableDate').click
  page.all('.datepickerSaturday.datepickerSelected.selectableDate').last.click

  page.first('.datepickerGoPrev').click
  page.first('.datepickerGoPrev').click
  page.first('.datepickerGoPrev').click

  previous_month_year = Date.today.mon - 3 > 0 ? Date.today.year : Date.today.year - 1
  page.should have_content("#{month_array[Date.today.mon - 3]}, #{previous_month_year}")
  previous_month_year = Date.today.mon - 4 > 0 ? Date.today.year : Date.today.year - 1
  page.should have_content("#{month_array[Date.today.mon - 4]}, #{previous_month_year}")
  previous_month_year = Date.today.mon - 5 > 0 ? Date.today.year : Date.today.year - 1
  page.should have_content("#{month_array[Date.today.mon - 5]}, #{previous_month_year}")

  page.first('.datepickerSaturday.selectableDate').click

  embed_image 'After date picker previous button was clicked three times and the range was set'

  page.should have_css('#loading')
  wait_for_ajax 25
  page.should have_no_css('#loading')

  page.first('.date-range-field').click
  page.should have_content("#{month_array[current_month]}, #{Date.today.year}")

  embed_image 'The date picker shows the new selected range'
end
