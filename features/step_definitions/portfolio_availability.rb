Then(/^Verify overtime panel is displayed$/) do

  # noinspection RubyResolve
  page.should have_content('Portfolio Availability Over Time')
  @insights_page.overtime_panel = page.find('#productCountOverTime')
  @insights_page.overtime_panel.should_not nil?

  # noinspection RubyResolve
  @insights_page.overtime_panel.should have_content 'Product count'

  sleep 1
end

Then(/^Click over the overtime legend buttons$/) do

  embed_image('Before click on In Stock')
  @insights_page.get_overtime_stripes().length.should eq(3)

  @insights_page.click_on_legend(/\AIn Stock\z/)
  embed_image('Before clicking on Out of Stock')
  @insights_page.get_overtime_stripes().length.should eq(2)

  @insights_page.click_on_legend(/\AOut of Stock\z/)
  embed_image('Before clicking on Void')
  @insights_page.get_overtime_stripes().length.should eq(1)

  @insights_page.click_on_legend('Void')
  embed_image('After clicking on Void')
  @insights_page.get_overtime_stripes().length.should eq(0)

  #Revert changes
  @insights_page.click_on_legend(/\AIn Stock\z/)
  @insights_page.get_overtime_stripes().length.should eq(1)

  @insights_page.click_on_legend(/\AOut of Stock\z/)
  @insights_page.get_overtime_stripes().length.should eq(2)

  @insights_page.click_on_legend('Void')
  @insights_page.get_overtime_stripes().length.should eq(3)

end
