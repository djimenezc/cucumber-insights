Then(/Click menu item "(.*?)"$/) do |link_id|
  page.find("##{link_id}").click
end

Then(/^Check panel scores of "(.*?)" panel$/) do |panel_id|
  @insights_page.score = page.find("##{panel_id} .percent").text
  # noinspection RubyResolve
  @browser.log.debug "Keep #{@insights_page.score} as score of #{panel_id}"
end

Then(/^Compare last graph value for panel "(.*?)" with stored score of panel/) do |panel_id|
  panel = page.find('#searchScoresOverTime')

  #allow the chart to render
  @insights_page.wait_delay 5

  panel.find('.highcharts-markers.highcharts-tracker').all('path')[0].hover

  #allow the popup to show
  @insights_page.wait_delay 1

  val = panel.find('.popover .popover-content div').text
  @insights_page.score.to_f.should eq(val.to_f.round)
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

  to = "#{toYear}-#{toMonth}-#{toDay}"
  from = "#{fromYear}-#{fromMonth}-#{fromDay}"

  jsToRun = "sessionModel.set('date',{ to: new Date('#{from}'), from: new Date('#{to}')})"
  @browser.driver.execute_script(jsToRun)

  verify_loading_mask_hidden
end
