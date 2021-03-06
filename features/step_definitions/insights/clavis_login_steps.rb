# noinspection RubyResolve
include Common_functions

Given(/^I am on the Clavis login homepage$/) do

  # noinspection RubyResolve
  visit @insights_page.url
end

When(/^I type the userName "(.*?)"$/) do |username|
  fill_in 'user_email', :with => username
  # noinspection RubyResolve
  @browser.log.info "Typing username: #{username}"
end


When(/^I type the password "(.*?)"$/) do |password|

  fill_in 'user_password', :with => password
  # noinspection RubyResolve
  @browser.log.info "Typing password: #{password}"
end


When(/^I click the clavis log in button$/) do
  embed_image

  # noinspection RubyResolve
  @browser.log.info "logging in with username: #{find('#user_email').value} password: #{find('#user_password').value}"

  click_button 'login'
end

Then(/^I am in the main page "(.*?)"$/) do |usernameLabel|
  embed_image

  verify_loading_mask_hidden 25

  # noinspection RubyResolve
  page.should have_content(usernameLabel)
  # noinspection RubyResolve
  page.should have_content('Clavis Insight')
end

Given(/^I log in Clavis homepage as "(.*?)"$/) do |usernameLabel|
  @insights_page.do_login(usernameLabel)
  page.should have_content('Executive Dashboard')
end

Given(/^I log in Clavis homepage as KCC US 2$/) do
  step 'I log in Clavis homepage as "KCC US"'
  step 'I am in the main page "KCC US"'
end

Given(/^I am in the executive login page$/) do
  visit "#{@insights_page.url}#executive"

  # verify_loading_mask_hidden 25
  # in some env the loading mask is display too fast
  page.should have_css('#pageTitle', :text => 'Executive Dashboard')

  embed_image
end

Then(/^Navigation Menu is visible$/) do
  @browser.log.info 'Verifying if the menu has few specific entries'

  # noinspection RubyResolve
  page.should have_content('Portfolio Availability')
  # noinspection RubyResolve
  page.should have_content('Executive Dashboard')
  # noinspection RubyResolve
  page.should have_content('Operations Dashboard')

  page.should have_selector('#pageTitle')
  embed_image 'Page is loaded completely'
end

Then(/^Click menu item ""$/) do

end

Given(/^Date picker date label is correct$/) do | |

  datepicker_info = @insights_page.get_datepicker_info
  datepicker_text = "#{datepicker_info.from_date_formatted} - #{datepicker_info.to_date_formatted}"

  @browser.log.info "date picker text expected #{datepicker_text}"

  expect(page).to have_css('.date-range-field > span', text: datepicker_text)
end

Then(/^Change date filter to select last 3 months$/) do

  @browser.log.info 'Change the filter date range to slect 3 months from today'

  calendar_button = page.first('.date-range-field')

  calendar_button.click
  calendar_popup = page.find('.date-range-calendar')

  # noinspection RubyResolve
  datepicker_info = @insights_page.get_datepicker_info
  # noinspection RubyResolve
  calendar_popup.should have_content("#{@insights_page.month_array[datepicker_info.previous_month]}, #{datepicker_info.previous_month_year}")
  # noinspection RubyResolve
  calendar_popup.should have_content("#{@insights_page.month_array[datepicker_info.current_month]}, #{Date.today.year}")
  # noinspection RubyResolve
  calendar_popup.should have_content("#{@insights_page.month_array[Date.today.mon]}, #{datepicker_info.next_month_year}")

  embed_image 'After date picker is clicked'

  calendar_popup.all('.datepickerSaturday.datepickerSelected.selectableDate > a').last.click

  calendar_popup.first('.datepickerGoPrev').click
  calendar_popup.first('.datepickerGoPrev').click
  calendar_popup.first('.datepickerGoPrev').click

  previous_month_year = Date.today.mon - 2 > 0 ? Date.today.year : Date.today.year - 1
  # noinspection RubyResolve
  calendar_popup.should have_content("#{@insights_page.month_array[Date.today.mon - 3]}, #{previous_month_year}")
  previous_month_year = Date.today.mon - 3 > 0 ? Date.today.year : Date.today.year - 1
  # noinspection RubyResolve
  calendar_popup.should have_content("#{@insights_page.month_array[Date.today.mon - 4]}, #{previous_month_year}")
  previous_month_year = Date.today.mon - 4 > 0 ? Date.today.year : Date.today.year - 1
  # noinspection RubyResolve
  calendar_popup.should have_content("#{@insights_page.month_array[Date.today.mon - 5]}, #{previous_month_year}")

  calendar_popup.first('.datepickerSaturday.selectableDate > a').click

  verify_loading_mask_hidden
end

Then(/^Verify that the date picker filter is applied$/) do

  embed_image 'After date picker previous button was clicked three times and the range was set'

  calendar_button = page.first('.date-range-field')

  calendar_button.click
  calendar_popup = page.find('.date-range-calendar')

  # noinspection RubyResolve
  calendar_popup.should have_content("#{@insights_page.month_array[@insights_page.get_datepicker_info.current_month]}, #{Date.today.year}")

  embed_image 'The date picker shows the new selected range'

  @browser.log.info 'Closing date picker'
  calendar_button.click
end

Then(/^Open dimension filter picker$/) do

  expect(page).to have_css('.filter_summary', text: 'All')
  page.first('.filter_summary').click
  page.should have_selector('.row-fluid.filters_selection', visible: true)
  # noinspection RubyResolve
  page.should have_content('Online Stores')
  # noinspection RubyResolve
  page.should have_content('Brands')
  # noinspection RubyResolve
  page.should have_content('Categories')
  expect(page).to have_css('.applyFilters', text: 'Apply', visible: true)

  embed_image 'The dimension filter is displayed'

end

Then(/^Uncheck categories$/) do

  filter_checkbox = find('input[data-name="Family Care"]')
  # noinspection RubyResolve
  filter_checkbox.should be_checked

  page.first('input[data-name="Baby Care"]').click
  page.first('input[data-name="Family Care"]').click

  # noinspection RubyResolve
  filter_checkbox.should_not be_checked

  page.first('.applyFilters').click

  verify_loading_mask_hidden 30

  page.first('.filter_summary').click
  wait_for_ajax 30

  embed_image 'Dashboard after the dimension filter were applied'
end