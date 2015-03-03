Given(/^I configure search panels to be displayed for customer "(.*?)"$/) do |customerLabel|
  @md_customer_list_page.configure_customer_report(customerLabel, 'Display Search Scores Panel', 1)
  @md_customer_list_page.configure_customer_report(customerLabel, 'Display Share of Search Panel', 1)
end

Given(/^I configure search panels to be hidden for customer "(.*?)"$/) do |customerLabel|
  @md_customer_list_page.configure_customer_report(customerLabel, 'Display Search Scores Panel', 0)
  @md_customer_list_page.configure_customer_report(customerLabel, 'Display Share of Search Panel', 0)
end

Given(/^I configure the priority search toggle to be on for customer "(.*?)"$/) do |customerLabel|
  @md_customer_list_page.configure_customer_report(customerLabel, 'Use Priority Search Terms', 1)
end

Given(/^I configure the priority search toggle to be off for customer "(.*?)"$/) do |customerLabel|
  @md_customer_list_page.configure_customer_report(customerLabel, 'Use Priority Search Terms', 0)
end