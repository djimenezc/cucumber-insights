And(/^I go to the search scores page$/) do
  click_link "Search Ranking"
  page.should have_css('div#search_ranking_submenu ul li a#search_ranking_management_menu_item')
  click_link "Search Scores"
  page.should have_css("body.search_ranking.management")

  verify_loading_mask_hidden 25
end

Then(/^The priority terms toggle is set to priority terms$/) do
  value = find(:css, 'ul li.priorityTermsPicker button.active').value
  expect(value).to eq "1"
end

Then(/^The priority terms toggle is set to all terms$/) do
  value = find(:css, 'ul li.priorityTermsPicker button.active').value
  expect(value).to eq '0'
end

And(/^I click the priority search terms toggle to be all terms$/) do
  find("ul li.priorityTermsPicker button[value='0']").click
end