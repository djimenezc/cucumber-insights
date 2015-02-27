# @author Lee Farrell
class MetadataBasePage

  attr_reader :name, :driver, :log, :url

  # Initialises ClavisHomePage Class
  #
  # @param [String] name defines the name of the instance
  # @param [Object] driver defines the driver instance
  # @param [Object] log defines the log instance
  # @param [Object] url defines the clavis login url
  def initialize(name, driver, log, url, scenario, username, password)
    @name = name
    @driver = driver
    @log = log
    @url = url
    @scenario = scenario
    @username = username
    @password = password
  end

  def open_metadata_home_page
    @scenario.visit self.url
    @scenario.fill_in 'user_email', :with => username
    @scenario.fill_in 'user_password', :with => password
    @scenario.click_button 'login'
  end

end