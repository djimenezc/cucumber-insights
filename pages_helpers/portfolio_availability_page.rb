# @author David Jimenez
class PortfolioAvailabilityPage < BasePage

  attr_accessor :score, :overtime_panel

  def click_on_legend (text)

    in_stock_legend_button = self.overtime_panel.find('tspan', :text => text)
    in_stock_legend_button.should_not nil?
    in_stock_legend_button.click
  end

  def get_overtime_stripes

    self.overtime_panel.all('.highcharts-series-group > .highcharts-series[visibility=visible]')
  end
end