Given(/^I configure search panels to be displayed for customer "(.*?)"$/) do |usernameLabel|
  @md_customer_list_page.configure_customer_report(usernameLabel, 'Display Search Scores Panel', 1)
  @md_customer_list_page.configure_customer_report(usernameLabel, 'Display Share of Search Panel', 1)
end

Given(/^I configure search panels to be hidden for customer "(.*?)"$/) do |usernameLabel|
  @md_customer_list_page.configure_customer_report(usernameLabel, 'Display Search Scores Panel', 0)
  @md_customer_list_page.configure_customer_report(usernameLabel, 'Display Share of Search Panel', 0)
end