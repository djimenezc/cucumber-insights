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
  @insights_page.overtime_stripes.length.should eq(3)

  @insights_page.click_on_overtime_legend(/\AIn Stock\z/)
  embed_image('Before clicking on Out of Stock')
  @insights_page.overtime_stripes.length.should eq(2)

  @insights_page.click_on_overtime_legend(/\AOut of Stock\z/)
  embed_image('Before clicking on Void')
  @insights_page.overtime_stripes.length.should eq(1)

  @insights_page.click_on_overtime_legend('Void')
  embed_image('After clicking on Void')
  @insights_page.overtime_stripes.length.should eq(0)

  #Revert changes
  @insights_page.click_on_overtime_legend(/\AIn Stock\z/)
  @insights_page.overtime_stripes.length.should eq(1)

  @insights_page.click_on_overtime_legend(/\AOut of Stock\z/)
  @insights_page.overtime_stripes.length.should eq(2)

  @insights_page.click_on_overtime_legend('Void')
  @insights_page.overtime_stripes.length.should eq(3)
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