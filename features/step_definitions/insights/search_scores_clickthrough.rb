And(/^I store the latest date score on the search scores panel$/) do
  step "Check panel scores of \"search_rankings_panel\" panel"
end

And(/^I click the search scores panel$/) do
  page.find('#search_rankings_panel').click
end

Then(/^I should see the same score as the last value in the trend$/) do
  step "Compare last graph value for panel \"searchScoresOverTime\" with stored score of panel"
end