# @author David Jimenez
module Insights
  class HomePage < Insights::BasePage

    attr_accessor :month_array

    # Initialises ClavisHomePage Class
    #
    # @param [String] name defines the name of the instance
    # @param [Object] driver defines the driver instance
    # @param [Object] log defines the log instance
    # @param [Object] url defines the clavis login url
    # @param [Object] page capybara page object
    def initialize(name, driver, log, url, scenario, page)
      super(name, driver, log, url, scenario, page)
      @month_array = Date::MONTHNAMES.slice(1, 12)
      @datepicker_info = nil
    end

    def get_datepicker_info

      previous_month = Date.today.mon - 2
      previous_month_year = Date.today.mon - 2 >= 0 ? Date.today.year : Date.today.year - 1
      current_month = Date.today.mon - 1
      next_month_year = Date.today.mon != 12 ? Date.today.year : Date.today.year + 1

      to_date_formatted = Time.now.to_s(:clavis_datepicker)
      one_month_ago = Time.now - (28 * 24 * 60 *60)
      from_date_formatted = one_month_ago.to_s(:clavis_datepicker)

      if @datepicker_info == nil
        @datepicker_info = DateObject.new(previous_month, previous_month_year, current_month, next_month_year, to_date_formatted, from_date_formatted)
      end

      @datepicker_info
    end

    class DateObject

      attr_reader :to_date_formatted, :from_date_formatted, :previous_month, :previous_month_year, :current_month, :next_month_year

      def initialize(previous_month, previous_month_year, current_month, next_month_year, to_date_formatted, from_date_formatted)

        @previous_month = previous_month
        @previous_month_year = previous_month_year
        @current_month = current_month
        @next_month_year = next_month_year
        @to_date_formatted = to_date_formatted
        @from_date_formatted = from_date_formatted
      end
    end
  end
end