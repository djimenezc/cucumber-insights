# Actions performed before each scenario
Before do |scenario|

  if scenario.source_tag_names.include? '@do-thing-1'
    # @browser.send("create_#{@tag}_page", self)
    page_id = 'ClavisHomePage';
  elsif scenario.source_tag_names.include? 'portfolio-availability'
    page_id = 'PortfolioAvailability'
  else
    page_id='BasePage'
  end

  # noinspection RubyResolve
  @insights_page = @browser.create_clavis_page(self, page_id)

  # noinspection RubyResolve
  @browser.log.info('Instancing clavis page')
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
