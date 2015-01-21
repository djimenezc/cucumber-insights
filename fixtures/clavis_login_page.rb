# @author David Jimenez
class ClavisHomePage

  attr_reader :name, :driver, :log, :url
  attr_accessor :month_array

  # Initialises ClavisHomePage Class
  #
  # @param [String] name defines the name of the instance
  # @param [Object] driver defines the driver instance
  # @param [Object] log defines the log instance
  # @param [Object] url defines the clavis login url
  def initialize(name, driver, log, url, scenario)
    @name = name
    @driver = driver
    @log = log
    @url = url
    @scenario = scenario
    @month_array = Date::MONTHNAMES.slice(1, 12)
    @datepicker_info = nil
  end

  def open_clavis_home_page

    username = 'kcc_us@clavistechnology.com'
    password = 'Testing!700'

    @scenario.visit self.url
    @scenario.fill_in 'user_email', :with => username
    @scenario.fill_in 'user_password', :with => password
    @scenario.click_button 'login'
  end

  def get_datepicker_info

    previous_month = Date.today.mon - 2
    previous_month_year = Date.today.mon - 2 > 0 ? Date.today.year : Date.today.year - 1
    current_month = Date.today.mon - 1
    next_month_year = Date.today.mon != 12 ? Date.today.year : Date.today.year + 1

    to_date_formatted = Time.now.to_s(:clavis_datepicker)
    from_date_formatted = Time.new(2014, 12, 24).to_s(:clavis_datepicker)

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