# noinspection RubyResolve
include Common_functions

Given(/^I click page size button$/) do

  page.first('.pagination.pagination-sm.dropup').click()
end

Given(/^Check a table is display$/) do

  page.first('.pagination.pagination-sm.dropup').click()
end

Given(/^Dropdown: Click "(.*?)" button$/) do |number_rows|

  within('.dropdown-menu') do
    click_on(number_rows)
  end
end

Then(/^Dropdown: Verify selected page size is "(.*?)"$/) do |number_rows|

  page.first('.pagination.pagination-sm.dropup').first('.dropdown-toggle').text().should
  include number_rows
end

Then(/^Dropdown: Verify the table displays "(.*?)" rows$/) do |number_rows|

  page.find('.table').find('tbody').all('tr').size().should
  equal number_rows
end