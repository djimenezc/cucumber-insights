# Actions performed before each scenario
Before do |scenario|

  if scenario.source_tag_names.include? '@do-thing-1'
    # @browser.send("create_#{@tag}_page", self)
    pageId = 'ClavisHomePage';
  elsif scenario.source_tag_names.include? 'do-thing-2'

  end

  @clavis_home_page = @browser.create_clavis_page(self, pageId)

  @browser.log.info('Instancing clavis page')
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

# Given that i log in a standard user do
#   steps %{
#         I log in Clavis home as "foo" with "bar"
#   }
# end

Given(/^I log in Clavis homepage as KCC US$/) do

  @clavis_home_page.open_clavis_home_page
end

Given(/^I am in the executive login page$/) do
  visit "#{@clavis_home_page.url}#executive"

  page.should have_css('#loading')
  page.should have_css('#pageTitle', :text => 'Executive Dashboard')
  wait_for_ajax 20
  page.should have_no_css('#loading')

  embed_image
end

Then(/^Navigation Menu is visible$/) do
  puts 'Verifying if the menu has few specific entries'

  page.should have_content('Portfolio Availability')
  page.should have_content('Executive Dashboard')
  page.should have_content('Operations Dashboard')

  page.should have_selector('#pageTitle')
  embed_image 'Page is loaded completely'
end

Then(/^Change the filter date range to '(\d+)\-(\d+)\-(\d+)' from '(\d+)\-(\d+)\-(\d+)'$/) do |toYear, toMonth, toDay, fromYear, fromMonth, fromDay|

  puts "Change the filter date range to #{toYear}-#{toMonth}-#{toDay} from #{fromYear}-#{fromMonth}-#{fromDay}"

  month_array = Date::MONTHNAMES.slice(1, 12)
  previous_month = Date.today.mon - 2
  previous_month_year = Date.today.mon - 2 > 0 ? Date.today.year : Date.today.year - 1
  current_month = Date.today.mon - 1
  next_month_year = Date.today.mon != 12 ? Date.today.year : Date.today.year + 1
  todayDateFormatted = Date.today.strftime('%b')
  datepickerText = '23rd Dec, 2014 - 20th Jan, 2015'

  puts "current date #{month_array[current_month]}, #{Date.today.year}"

  expect(page).to have_css('.date-range-field > span', text: datepickerText)
  page.first('.date-range-field').click

  page.should have_content("#{month_array[previous_month]}, #{previous_month_year}")
  page.should have_content("#{month_array[current_month]}, #{Date.today.year}")
  page.should have_content("#{month_array[Date.today.mon]}, #{next_month_year}")

  embed_image 'After date picker is clicked'

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

  puts 'Closing date picker'
  page.first('.date-range-field').click
end

Then(/^Open dimension filter picker$/) do

  expect(page).to have_css('.filter_summary', text: 'All')
  page.first('.filter_summary').click
  page.should have_selector('.row-fluid.filters_selection', visible: true)
  page.should have_content('Online Stores')
  page.should have_content('Brands')
  page.should have_content('Categories')
  expect(page).to have_css('.applyFilters', text: 'Apply', visible: true)

  embed_image 'The dimension filter is displayed'

  filter_checkbox = find('input[data-name="Family Care"]')
  filter_checkbox.should be_checked

  page.first('input[data-name="Baby Care"]').click
  page.first('input[data-name="Family Care"]').click

  filter_checkbox.should_not be_checked

  page.first('.applyFilters').click
  page.should have_css('#loading')
  wait_for_ajax 25
  page.should have_no_css('#loading')

  page.first('.filter_summary').click
  wait_for_ajax 25

  embed_image 'Dashboard after the dimension filter were applied'
end