Then(/^Verify all the executive panels are displayed$/) do

  page.find('#portfolio_availability_panel')
  # page.find('#imaging_panel')
  page.find('#ratings_and_reviews_panel')
  page.find('#price_management_panel')
  page.find('#menu_panel')
  page.find('#search_rankings_panel')
  page.find('#share_of_search_rankings_panel')
end
