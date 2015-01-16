# @author David Jimenez
class ClavisHomePage

  attr_reader :name, :driver, :log, :url

  # Initialises ClavisHomePage Class
  #
  # @param [String] name defines the name of the instance
  # @param [Object] driver defines the driver instance
  # @param [Object] log defines the log instance
  # @param [Object] url defines the clavis login url
  def initialize(name, driver, log, url)
    @name = name
    @driver = driver
    @log = log
    @url = url

  end

  def open_clavis_home_page

    username = 'kcc_us@clavistechnology.com'
    password = 'Testing!700'

    visit self.url
    fill_in 'user_email', :with => username
    fill_in 'user_password', :with => password
    click_button 'login'
  end

end