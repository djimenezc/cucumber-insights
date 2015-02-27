Then(/^I go to the exec dash$/) do
  click_link 'Executive Dashboard'
  verify_loading_mask_hidden 25
end

Given(/^I configure search panels to be displayed$/) do
  # # noinspection RubyResolve
  # jsToRun = <<-eos
  #   var searchReport = _.findWhere(ClavisCustomer.reports, {name: 'Search'});
  #   var searchReportConfigs = searchReport.configuration;
  #   var displaySearchScoresPanelConfig = _.findWhere(searchReportConfigs, {name: 'Display Search Scores Panel'});
  #   displaySearchScoresPanelConfig.value = '1';
  #
  #   var displayShareOfSearchPanelConfig = _.findWhere(searchReportConfigs, {name: 'Display Share of Search Panel'});
  #   displayShareOfSearchPanelConfig.value = '1';
  # eos
  #
  # # noinspection RubyResolve
  # @browser.driver.execute_script(jsToRun)


  @md_customer_page = Metadata::CustomersPage.new()
end

Then(/^I should see the search panels$/) do
  page.should have_content('Search Ranking - Search Scores')
  page.should have_content('Search Ranking - Share of Search')
end

Given(/^I configure search panels to be hidden$/) do
  jsToRun = <<-eos
    var searchReport = _.findWhere(ClavisCustomer.reports, {name: 'Search'});
    var searchReportConfigs = searchReport.configuration;
    var displaySearchScoresPanelConfig = _.findWhere(searchReportConfigs, {name: 'Display Search Scores Panel'});
    displaySearchScoresPanelConfig.value = '0';

    var displayShareOfSearchPanelConfig = _.findWhere(searchReportConfigs, {name: 'Display Share of Search Panel'});
    displayShareOfSearchPanelConfig.value = '0';
  eos

  # noinspection RubyResolve
  @browser.driver.execute_script(jsToRun)
end

Then(/^I should not see the search panels$/) do
  page.should_not have_content('Search Ranking - Search Scores')
  page.should_not have_content('Search Ranking - Share of Search')
end