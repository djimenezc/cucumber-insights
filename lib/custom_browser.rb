# @author Jonathan Chrisp

class CustomBrowser
  # noinspection RubyResolve
  include DateHelper
  # noinspection RubyResolve
  include DirectoryHelper
  include RSpec::Matchers
  # noinspection RubyResolve
  include Common_functions

  attr_reader :driver, :browser_name, :x_position, :y_position, :screen_width, :screen_height, :log

  # Initialises Browser Class
  #
  # @param [String] browser_name defines the browserName
  # @param [String] x_position defines the xPosition
  # @param [String] y_position defines the yPosition
  # @param [String] screen_width defines the screenWidth
  # @param [String] screen_height defines the screen_height
  def initialize(browser_name, x_position, y_position, screen_width, screen_height)
    @browser_name = browser_name
    @log = Logger.new(DirectoryHelper.create_log_directory + browser_name + '-' + DateHelper.set_log_timestamp, 'daily')
    @driver = start_browser(@browser_name)
    @x_position = x_position
    @y_position = y_position
    @screen_width = screen_width
    @screen_height = screen_height
  end

  # Deletes all cookies from the browser
  def delete_cookies
    @log.info('Deleting the ' + @browser_name + ' browser cookies')
    @driver.manage.delete_all_cookies
  end

  # Moves the browser window to set position on screen
  def move_browser(x_position, y_position)
    x_position ? x_position : x_position = 0
    y_position ? y_position : y_position = 0

    @log.info('Moving the browser to: ' + x_position.to_s + ', ' + y_position.to_s)
    @driver.manage.window.move_to(x_position, y_position)
  end

  # Opens google
  def open_google
    self.delete_cookies
    @driver.navigate.to('http://www.google.co.uk')

    # Return GoogleHome page instance
    GoogleHomePage.new('GoogleHomePage', @driver, @log)
  end

  # Sets the timeout to find elements
  #
  # @param [String] timeout value for timeout
  def set_timeout(timeout)
    @log.info('Setting the selenium timeout to: ' + timeout.to_s)
    @driver.manage.timeouts.implicit_wait = timeout
  end

  # Sets the width and height of window
  #
  # @param [String] screen_width sets the width of the browsers window
  # @param [String] screen_height sets the height of the browsers window
  def set_window_size(screen_width, screen_height)
    # Set screen_width and screen_height if defined
    screen_width ? screen_width : screen_width = 1280
    screen_height ? screen_height : screen_height = 1024

    @log.info('Setting the screen window size to: ' + screen_width.to_s + 'x' + screen_height.to_s)
    # @note this is currently supported in Chrome and FF
    @driver.manage.window.resize_to(screen_width, screen_height)
  end

  # Starts the browser
  #
  # @param [String] browser define browser to use
  def start_browser(browser)
    @log.info('Starting the browser: ' + browser)

    # Define browser to use from config
    case browser
      when 'firefox'
        Capybara.configure do |capybara|
          capybara.register_driver :selenium_ff do |app|
            Capybara::Selenium::Driver.new(app, :browser => :firefox)
          end

        end
        driver = :selenium
      when 'chrome'
        Capybara.configure do |capybara|
          capybara.register_driver :chrome do |app|
            Capybara::Selenium::Driver.new(app, :browser => :chrome)
          end
        end
        driver = :chrome

      # Check Platform running script
      # if RUBY_PLATFORM.downcase.include?('darwin')
      #   @log.info('Using the Mac operating system')
      #   Selenium::WebDriver.for :chrome
      # elsif RUBY_PLATFORM.downcase.include?('linux')
      #   @log.info('Using Linux operating system')
      #   Selenium::WebDriver::Chrome.path = '/usr/lib/chromium-browser/chromium-browser'
      #   Selenium::WebDriver.for :chrome
      # else
      #   # Default to standard if unable to determine
      #   @log.info('Unable to determine OS - probably Windows')
      #   Selenium::WebDriver.for :chrome
      # end
      when 'safari'
        Selenium::WebDriver.for :safari
      when 'ios'
        if RUBY_PLATFORM.downcase.include?('darwin')
          Selenium::WebDriver.for :iphone
        else
          raise 'You can\'t run IOS tests on non-mac machine'
        end
      else
        # Default to using chrome
        @log.info('Could not determine the browser to use so using chrome')
        Selenium::WebDriver.for :chrome
    end

    RSpec.configure do |config|
      config.include Capybara::DSL
    end

    Capybara.run_server = false
    Capybara.default_driver = driver #set the browser you want to run the test on
    Capybara.javascript_driver = driver
    Capybara.app_host = 'http://www.google.co.uk' #if you have your own project, you can set your own app_host here.

    # Return driver
    Capybara.current_session.driver.browser
  end

end