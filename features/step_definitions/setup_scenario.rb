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

  #if a scenario needs metadata
  if scenario.source_tag_names.include? '@metadata'
    @metadata_page = @browser.create_metadata_page(self)
  end

  # noinspection RubyResolve
  @browser.log.info('Instancing clavis page')
end