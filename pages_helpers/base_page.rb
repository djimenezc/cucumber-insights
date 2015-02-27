# @author David Jimenez
class BasePage

  attr_reader :name, :driver, :log, :url, :page

  DELAY = 0.5

  # Initialises ClavisHomePage Class
  #
  # @param [String] name defines the name of the instance
  # @param [Object] driver defines the driver instance
  # @param [Object] log defines the log instance
  # @param [Object] url defines the clavis login url
  def initialize(name, driver, log, url, scenario, page)
    @name = name
    @driver = driver
    @log = log
    @url = url
    @scenario = scenario
    @page = page
  end

  def open_clavis_home_page(username_label)

    if username_label == 'General Mills US'
      username = 'general_mills_us@clavistechnology.com'
      password = 'Testing!800'
    elsif (username_label == 'KCC US')
      username = 'kcc_us@clavistechnology.com'
      password = 'Testing!700'
    elsif (username_label == 'KCC US TEST')
      username = 'kcc_us_test2@clavisinsight.com'
      password = 'Testing!700'
    else
      username = 'kcc_us_test2@clavisinsight.com'
      password = 'Testing!700'
    end

    @scenario.visit self.url
    @scenario.fill_in 'user_email', :with => username
    @scenario.fill_in 'user_password', :with => password
    @scenario.click_button 'login'
  end

  def back_previous_page
    page.evaluate_script('window.history.back()')
  end

  def get_filter_summary_node

    @page.find('.filters .filter_list .filter_summary')
  end

  def get_filter_summary

    self.get_filter_summary_node.text.split(';')
  end

  def wait_delay (delay= DELAY)
    sleep delay
  end
end