# This class provides helper functions to interact with the portfolio availability
# report page.
# Many element of the report are kept in the class and can be accessed through
# the instance attribute

# @author David Jimenez
module Insights
  class PortfolioAvailabilityPage < Insights::BasePage

    attr_accessor  :overtime_panel, :by_online_store_panel,
                  :online_bar_rows, :online_store_labels

    def click_on_overtime_legend (text)

      self.click_on_legend(self.overtime_panel, text)
    end

    def click_on_by_online_legend (text)

      self.click_on_legend(self.by_online_store_panel, text)
    end

    def click_on_legend (panel, text)

      in_stock_legend_button = panel.find('tspan', :text => text)
      in_stock_legend_button.should_not nil?
      in_stock_legend_button.click

      self.wait_delay
    end

    def overtime_stripes

      self.get_chart_stripes(self.overtime_panel)
    end

    def online_number_bar_square

      self.get_chart_stripes(self.by_online_store_panel)
    end

    def get_chart_stripes(panel)

      panel.all('.highcharts-series-group > .highcharts-series[visibility=visible]')
    end

    def get_online_store_labels

      self.online_store_labels = []

      self.by_online_store_panel.all('.highcharts-axis-labels')[0].all('tspan').each do |node|
        self.online_store_labels.push(node.text)
      end

      self.online_store_labels
    end

    def get_online_bar_rows

      self.online_bar_rows = self.by_online_store_panel.all('.highcharts-series.highcharts-tracker')

      self.online_bar_rows
    end
  end
end