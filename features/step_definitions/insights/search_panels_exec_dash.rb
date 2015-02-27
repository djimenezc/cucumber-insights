Then(/^I go to the exec dash$/) do
  click_link 'Executive Dashboard'
  verify_loading_mask_hidden 25
end

Then(/^I should see the search panels$/) do
  page.should have_content('Search Ranking - Search Scores')
  page.should have_content('Search Ranking - Share of Search')
end

Then(/^I should not see the search panels$/) do
  page.should_not have_content('Search Ranking - Search Scores')
  page.should_not have_content('Search Ranking - Share of Search')
end