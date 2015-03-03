# Actions performed before each scenario
Before do |scenario|

  if scenario.source_tag_names.include? '@home-page'
    # @browser.send("create_#{@tag}_page", self)
    page_id = 'Insights::HomePage';
  elsif scenario.source_tag_names.include? '@portfolio-availability'
    page_id = 'Insights::PortfolioAvailabilityPage'
  elsif scenario.source_tag_names.include? '@portfolio-availability'
    page_id = 'Insights::SearchScoresPage'
  else
    page_id='Insights::BasePage'
  end

  # noinspection RubyResolve
  @insights_page = @browser.create_clavis_page(self, page_id, page)

  #initialise the metadata pages
  @md_login_page = @browser.create_metadata_login_page(self, page)
  @md_customer_list_page = @browser.create_metadata_customer_list_page(self, page)

  # noinspection RubyResolve
  @browser.log.info('Instancing clavis page')
end