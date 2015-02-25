# @author David Jimenez
class BasePage

  attr_reader :name, :driver, :log, :url

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
  end

  def open_clavis_home_page(username_label)

    if username_label == 'General Mills US'
      username = 'general_mills_us@clavistechnology.com'
      password = 'Testing!800'
    elsif (username_label == 'KCC US')
      username = 'kcc_us@clavistechnology.com'
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

end