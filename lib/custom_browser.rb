# @author Jonathan Chrisp

class CustomBrowser
  # noinspection RubyResolve
  include DateHelper
  # noinspection RubyResolve
  include DirectoryHelper
  include RSpec::Matchers
  # noinspection RubyResolve
  include Common_functions

  attr_reader :driver, :browser_name, :x_position, :y_position, :screen_width, :screen_height, :log, :site_url, :headless

  # Initialises Browser Class
  #
  # @param [String] browser_name defines the browserName
  # @param [String] x_position defines the xPosition
  # @param [String] y_position defines the yPosition
  # @param [String] screen_width defines the screenWidth
  # @param [String] screen_height defines the screen_height
  # @param [String] site_url defines url of the site
  def initialize(browser_name, x_position, y_position, screen_width, screen_height, site_url)
    @browser_name = browser_name
    @log = Logger.new(DirectoryHelper.create_log_directory + browser_name + '-' + DateHelper.set_log_timestamp, 'daily')
    @driver, @headless = start_browser(@browser_name)
    @x_position = x_position
    @y_position = y_position
    @screen_width = screen_width
    @screen_height = screen_height
    @site_url = site_url

  end

  # Deletes all cookies from the browser
  def delete_cookies
    if @browser_name != 'poltergeist'
      @log.info('Deleting the ' + @browser_name + ' browser cookies')
      @driver.manage.delete_all_cookies
    end
  end

  # Moves the browser window to set position on screen
  def move_browser(x_position, y_position)
    x_position ? x_position : x_position = 0
    y_position ? y_position : y_position = 0

    @log.info('Moving the browser to: ' + x_position.to_s + ', ' + y_position.to_s)
    @driver.manage.window.move_to(x_position, y_position)
  end

  # Opens clavis
  def create_clavis_page(scenario, page_id, page)
    #initialize login details


    self.delete_cookies

    page_class = class_from_string(page_id)

    # Return Clavis page instance
    page_id != '' ? page_class.new(page_id, @driver, @log, @site_url, scenario, page) : nil
  end

  def create_metadata_login_page(scenario, page)
    @metadata_base_url = CONFIG['METADATA_URL']
    @metadata_username = CONFIG['METADATA_USERNAME']
    @metadata_password = CONFIG['METADATA_PASSWORD']

    @metadata_login_url = @metadata_base_url + '/users/sign_in'
    @metadata_login_page = Metadata::LoginPage.new(@driver, @log, @metadata_login_url, scenario, page, @metadata_username, @metadata_password)
  end

  def create_md_customer_list_page(scenario, page)
    @metadata_base_url = CONFIG['METADATA_URL']
    @metadata_customer_list_url = @metadata_base_url + '/customers'
    @md_customer_list_page = Metadata::CustomerListPage.new(@driver, @log, @metadata_customer_list_url, scenario, page)
  end

  # Sets the timeout to find elements
  #
  # @param [String] timeout value for timeout
  def set_timeout(timeout, element_timeout)
    @log.info('Setting the selenium timeout to: ' + timeout.to_s + ' element timeout: '+element_timeout.to_s)
    @driver.manage.timeouts.implicit_wait = timeout
    Capybara.default_wait_time = element_timeout
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

    driver = nil
    headless = nil
    browserstack_url = self.get_browserstack_url
    browserstack_capabilities = self.get_browser_capabilities

    Capybara::Screenshot.autosave_on_failure = true
    Capybara.save_and_open_page_path = 'errors'

    self.get_browser_capabilities
    # Define browser to use from config
    case browser
      when 'firefox'
        Capybara.configure do |capybara|
          capybara.register_driver :selenium_ff do |app|
            if ENV['BROWSERSTACK'] && ENV['BROWSERSTACK'] == 'true'
              Capybara::Selenium::Driver.new(app, :browser => :firefox, :url => browserstack_url, :desired_capabilities => browserstack_capabilities)
            else
              Capybara::Selenium::Driver.new(app, :browser => :firefox)
            end
          end

        end
        driver = :selenium
      when 'chrome'
        Capybara.configure do |capybara|
          capybara.register_driver :chrome do |app|
            if ENV['BROWSERSTACK'] && ENV['BROWSERSTACK'] == 'true'
              Capybara::Selenium::Driver.new(app, :browser => :chrome, :url => browserstack_url, :desired_capabilities => browserstack_capabilities)
            else
              Capybara::Selenium::Driver.new(app, :browser => :chrome)
            end
          end
        end
        driver = :chrome
      when 'safari'
        Selenium::WebDriver.for :safari
      when 'ios'
        if RUBY_PLATFORM.downcase.include?('darwin')
          Selenium::WebDriver.for :iphone
        else
          raise 'You can\'t run IOS tests on non-mac machine'
        end
      when 'selenium'
        driver = :selenium
        require 'headless'

        video_opts = {
            log_file_path: '/tmp/headless.log'
        }

        headless = Headless.new(display: 100, reuse: true, destroy_at_exit: false, video: video_opts)
        headless.start
      when 'poltergeist'
        driver = :poltergeist
        Capybara.register_driver :poltergeist do |app|
          options = {
              :js_errors => true,
              :timeout => 120,
              :debug => false,
              :phantomjs_options => %w(--load-images=no --disk-cache=false),
              :inspector => true,
          }
          Capybara::Poltergeist::Driver.new(app, options)
        end
      else
        # Default to using chrome
        @log.info('Could not determine the browser to use so using chrome')
        driver = Selenium::WebDriver.for :chrome
    end

    RSpec.configure do |config|
      config.include Capybara::DSL
    end

    Capybara.run_server = false
    Capybara.default_driver = driver #set the browser you want to run the test on
    Capybara.javascript_driver = driver
    Capybara.app_host = 'http://www.google.co.uk' #if you have your own project, you can set your own app_host here.

    # Return driver
    return Capybara.current_session.driver.browser, headless
  end

  def get_browserstack_url

    username=CONFIG['BS_USERNAME']
    key=CONFIG['BS_AUTHKEY']

    "http://#{username}:#{key}@hub.browserstack.com/wd/hub"
  end

  def get_browser_capabilities

    capabilities = Selenium::WebDriver::Remote::Capabilities.new

    capabilities['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
    capabilities['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']

    if ENV['BS_AUTOMATE_OS']
      capabilities['os'] = ENV['BS_AUTOMATE_OS']
      capabilities['os_version'] = ENV['BS_AUTOMATE_OS_VERSION']
    else
      capabilities['platform'] = ENV['SELENIUM_PLATFORM'] || 'ANY'
    end

    capabilities['browser'] = ENV['SELENIUM_BROWSER'] || 'chrome'
    capabilities['browser_version'] = ENV['SELENIUM_VERSION'] if ENV['SELENIUM_VERSION']

    capabilities['browserstack.debug'] = 'true'
    capabilities['name'] = 'Testing Insights Login Page'

    @log.info "BrowserStack capabilities project: #{capabilities['project']} OS: #{capabilities['os']} platform: #{capabilities['platform']}"

    capabilities
  end
end