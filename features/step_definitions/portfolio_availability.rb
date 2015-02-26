Then(/^Verify overtime panel is displayed$/) do

  # noinspection RubyResolve
  page.should have_content('Portfolio Availability Over Time')
  panel = page.find('#productCountOverTime')
  panel.should_not nil?

  # noinspection RubyResolve
  panel.should have_content 'Product count'

  sleep 1
  embed_image('Before click on In Stock')

  @insights_page.get_overtime_stripes(panel).length.should eq(3)

  @insights_page.click_on_legend(panel, /\AIn Stock\z/)
  embed_image('Before clicking on Out of Stock')
  @insights_page.get_overtime_stripes(panel).length.should eq(2)

  @insights_page.click_on_legend(panel, /\AOut of Stock\z/)
  embed_image('Before clicking on Void')
  @insights_page.get_overtime_stripes(panel).length.should eq(1)

  @insights_page.click_on_legend(panel, 'Void')
  embed_image('After clicking on Void')
  @insights_page.get_overtime_stripes(panel).length.should eq(0)
end
