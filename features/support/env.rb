# Rubygems and Bundler
require 'rubygems'
require 'bundler/setup'

# Gems
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'rspec'
require 'selenium-webdriver'
require File.expand_path('../../../3rd_party_libraries/fast_selenium', __FILE__) if ENV['BROWSERSTACK'] == 'true'
require 'minitest/autorun'
require 'cucumber'
require 'xmlsimple'
require 'net/http'
require 'nokogiri'
require 'require_all'
require File.expand_path('../common_lib', __FILE__)
require 'date'

require_all 'lib'
require_all 'pages_helpers'
require_all 'config/initializers'

$timeout = 1
$element_timeout=10

#load the config file
CONFIG = YAML.load_file('config/config.yml')

# Setup Browser
@browser_id = CONFIG['CONTROLLER']
@site_url = CONFIG['URL']

puts "Starting #{@browser_id} browser #{@site_url}"

Dir.mkdir('logs') unless File.exists?('logs')
Dir.mkdir('reports') unless File.exists?('reports')

browser = CustomBrowser.new(@browser_id, ENV['XPOSITION'], ENV['YPOSITION'], ENV['SCREENWIDTH'], ENV['SCREENHEIGHT'], @site_url)

if @browser_id != 'poltergeist'
  browser.set_window_size(browser.screen_width, browser.screen_height)
  browser.move_browser(browser.x_position, browser.y_position)
  browser.delete_cookies
  browser.set_timeout($timeout, $element_timeout)
end

# Actions performed before each scenario
Before do |scenario|
  # Create browser instance variable
  @browser = browser
  scenario_title = scenario.respond_to?('title') ? scenario.title : scenario.scenario_outline.name

  browser.log.info('Starting the scenario: ' + "#{scenario_title}")
end

at_exit do

  puts 'at_exit'
  browser.log.info 'at_exit'

  if @browser_id == 'chrome' && ENV['BROWSERSTACK'] != 'true'
    browser.log.info('Quiting the browser at: ' + DateHelper.set_log_timestamp)
    puts 'Closing browser and session'
    browser.driver.quit
  end
end

After do | |

  puts 'After scenario is executed'
end