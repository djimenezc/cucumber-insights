# Actions performed before each scenario
Before do |scenario|

  if scenario.source_tag_names.include? '@do-thing-1'
    # @browser.send("create_#{@tag}_page", self)
    page_id = 'ClavisHomePage';
  elsif scenario.source_tag_names.include? '@portfolio-availability'
    page_id = 'PortfolioAvailabilityPage'
  else
    page_id='BasePage'
  end

  # noinspection RubyResolve
  @insights_page = @browser.create_clavis_page(self, page_id)

  # noinspection RubyResolve
  @browser.log.info('Instancing clavis page')
end

Then(/Click menu item "(.*?)"$/) do |link_id|
  page.find("##{link_id}").click
end

Then(/^Check panel scores of "(.*?)" panel$/) do |panel_id|
  @insights_page.score = page.find("##{panel_id} .percent").text
  # noinspection RubyResolve
  @browser.log.debug "Keep #{@insights_page.score} as score of #{panel_id}"
end

Then(/^Verify report score matches the scorecard score$/) do
  @insights_page.score.should eq(page.find('.total-panel.panel-body.text-center svg .highcharts-title > tspan').text.split('%')[0])
end

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

Then(/^Change the filter date range to '(\d+)\-(\d+)\-(\d+)' from '(\d+)\-(\d+)\-(\d+)'$/) do |toYear, toMonth, toDay, fromYear, fromMonth, fromDay|

  from = "#{toYear}-#{toMonth}-#{toDay}"
  to = "#{fromYear}-#{fromMonth}-#{fromDay}"

  jsToRun = "sessionModel.oDateRangePicker.setDates(new Date('#{from}'), new Date('#{to}'))"

  @browser.driver.execute_script(jsToRun)

  verify_loading_mask_hidden 20
end