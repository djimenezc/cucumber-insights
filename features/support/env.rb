# Rubygems and Bundler
require 'rubygems'
require 'bundler/setup'

# Gems
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'rspec'
require 'selenium-webdriver'
# require 'test/unit/assertions'
require 'minitest/autorun'
require 'cucumber'
require 'xmlsimple'
require 'net/http'
require 'nokogiri'
require 'require_all'
require File.expand_path('../Common_Lib', __FILE__) #require
require 'date'

require_all 'lib'
require_all 'pages_helpers'
require_all 'config/initializers'

$timeout = 1
$element_timeout=2

# Setup Browser
@browser_id = ENV['CONTROLLER'] ? ENV['CONTROLLER'] : 'firefox'
@site_url = ENV['URL'] ? ENV['URL'] : 'http://all-ei-dev.elasticbeanstalk.com/'

puts "Starting #{@browser_id} browser #{ENV['URL']}"

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
  puts 'Closing browser and session'
  browser.log.info('Quiting the browser at: ' + DateHelper.set_log_timestamp)
  if @browser_id != 'poltergeist'
    browser.driver.quit
  end
end

After do | |

  puts 'After scenario is executed'
end