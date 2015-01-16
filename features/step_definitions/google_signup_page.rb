include Common_functions

Given(/^I'm on "(.*?)" page$/) do |page_to|
  visit page_to
end

When(/^I input "(.*?)" in "(.*?)"$/) do |invalid_value, field|
  wait_for_element :xpath,field   # wait for element display on page
  find(:xpath,field).set invalid_value
  find(:xpath,field).native.send_keys(:tab)
end

Then(/^I should see something like "(.*?)" in label "(.*?)"$/) do |error_msg, labelError|
  msg = find(:xpath,labelError).text()
  msg.should == error_msg
end