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

end