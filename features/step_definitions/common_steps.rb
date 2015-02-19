Then(/^Back to the previous page$/) do
  page.evaluate_script('window.history.back()')
end

Then(/^Click "(.*?)" panel$/) do |panel_id|

  page.find("##{panel_id}").click
end

Then(/^Verify title is "(.*?)"$/) do |title|

  page.should have_css('#pageTitle', :text => title)
end

Then(/^Verify subTitle is "(.*?)"$/) do |subTitle|

  page.should have_css('#subTitle', :text => subTitle)
end

Then(/^Verify subTitle is not displayed$/) do

  page.should_not have_css('#subTitle')
end
