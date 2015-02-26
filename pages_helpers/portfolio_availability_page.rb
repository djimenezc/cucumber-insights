# @author David Jimenez
class PortfolioAvailabilityPage < BasePage

  attr_accessor :score

  def click_on_legend (panel, text)

    in_stock_legend_button = panel.find('tspan', :text => text)
    in_stock_legend_button.should_not nil?
    in_stock_legend_button.click
  end

  def get_overtime_stripes (panel)

    panel.all('.highcharts-series-group > .highcharts-series[visibility=visible]')
  end
end