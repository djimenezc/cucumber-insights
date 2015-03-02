Then(/^Verify overtime panel is displayed$/) do

  # noinspection RubyResolve
  page.should have_content('Portfolio Availability Over Time')
  @insights_page.overtime_panel = page.find('#productCountOverTime')
  @insights_page.overtime_panel.should_not nil?

  # noinspection RubyResolve
  @insights_page.overtime_panel.should have_content 'Product count'

  # noinspection RubyResolve
  @insights_page.overtime_panel.should have_content 'In Stock'
  # noinspection RubyResolve
  @insights_page.overtime_panel.should have_content 'Out of Stock'
  # noinspection RubyResolve
  @insights_page.overtime_panel.should have_content 'Void'

  sleep @insights_page.wait_delay
end

Then(/^Click over the overtime legend buttons$/) do

  embed_image('Before click on In Stock')

  displayed_stripes = @insights_page.overtime_stripes.length

  @insights_page.click_on_overtime_legend(/\AIn Stock\z/)
  embed_image('Before clicking on Out of Stock')
  @insights_page.overtime_stripes.length.should eq(displayed_stripes - 1)

  @insights_page.click_on_overtime_legend(/\AOut of Stock\z/)
  embed_image('Before clicking on Void')
  @insights_page.overtime_stripes.length.should eq(displayed_stripes - 2)

  @insights_page.click_on_overtime_legend('Void')
  embed_image('After clicking on Void')
  @insights_page.overtime_stripes.length.should eq(displayed_stripes - 3)

  #Revert changes
  @insights_page.click_on_overtime_legend(/\AIn Stock\z/)
  @insights_page.overtime_stripes.length.should eq(displayed_stripes - 2)

  @insights_page.click_on_overtime_legend(/\AOut of Stock\z/)
  @insights_page.overtime_stripes.length.should eq(displayed_stripes - 1)

  @insights_page.click_on_overtime_legend('Void')
  @insights_page.overtime_stripes.length.should eq(displayed_stripes)
end

Then(/^Verify panel by online store is displayed$/) do

  @insights_page.by_online_store_panel = page.find('#chartProductCountByDimension')

  @insights_page.by_online_store_panel.should_not nil?

  # noinspection RubyResolve
  @insights_page.by_online_store_panel.should have_content 'Product count'
  # noinspection RubyResolve
  @insights_page.by_online_store_panel.should have_content 'In Stock'
  # noinspection RubyResolve
  @insights_page.by_online_store_panel.should have_content 'Void'

  @insights_page.wait_delay
end

Then(/^Click over the legend buttons in the panel by Online Store$/) do

  @insights_page.online_number_bar_square.length.should eq(2)

  @insights_page.click_on_by_online_legend('Void')
  @insights_page.online_number_bar_square.length.should eq(1)
  embed_image('After clicking on Void')
  @insights_page.click_on_by_online_legend('In Stock')
  @insights_page.online_number_bar_square.length.should eq(0)
  embed_image('After clicking on In Stock')

  @insights_page.click_on_by_online_legend('Void')
  @insights_page.online_number_bar_square.length.should eq(1)
  @insights_page.click_on_by_online_legend('In Stock')
  @insights_page.online_number_bar_square.length.should eq(2)

end

Then(/^There are "(.*?)" bars in the Online Store panel$/) do |number_bars|

  online_bar_stripes = @insights_page.get_online_bar_rows

  online_bar_stripes.length.should eq(number_bars)
end

Then(/^Mouse over the bar "(.*?)" in the panel by Online Store$/) do |bar_position|

  online_bar_stripes = @insights_page.get_online_bar_rows

  @insights_page.get_online_store_labels.length.should eq(2)

  online_bar_stripes[0].all('rect')[bar_position.to_i].hover
  @insights_page.wait_delay
  embed_image("#{(bar_position.to_i + 1).ordinalize} bar moused over")
end

Then(/^Display product count of bar "(.*?)" in the overtime panel$/) do |bar_position|

  @insights_page.by_online_store_panel.find('.product-count-over-time.btn.btn-default.btn-block.btn-sm').click
  @insights_page.wait_delay 0.9
  embed_image("#{(bar_position.to_i + 1).ordinalize} product count displayed on OverTime panel")
end

Then(/^Check the chart column label "(.*?)" position match with the tooltip title$/) do |bar_position|

  @insights_page.by_online_store_panel.find('.popover-title').text.should eq(@insights_page.online_store_labels[bar_position.to_i])
end

Then(/^Drill down to the Online Store Analysis report$/) do

  @insights_page.by_online_store_panel.find('.availability-analysis.btn').click
end

Then(/^Verify the filter summary matches with the online store "(.*?)" in portfolio availability chart$/) do |bar_position|

  @insights_page.online_store_labels[bar_position.to_i].should eq(@insights_page.get_filter_summary[0])
end