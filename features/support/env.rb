# Rubygems and Bundler
require 'rubygems'
require 'bundler/setup'

# Gems
require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'test/unit/assertions'
require 'cucumber'
require 'xmlsimple'
require 'net/http'
require 'nokogiri'
require 'require_all'
require File.expand_path('../Common_Lib',__FILE__) #require

require_all 'lib'
require_all 'fixtures'

$timeout = 10

# Setup Browser
@browser_id = ENV['CONTROLLER'] ? ENV['CONTROLLER'] : 'firefox'

puts "Starting #{@browser_id} browser"

browser = CustomBrowser.new(@browser_id, ENV['XPOSITION'], ENV['YPOSITION'], ENV['SCREENWIDTH'], ENV['SCREENHEIGHT'])

browser.set_window_size(browser.screen_width, browser.screen_height)
browser.move_browser(browser.x_position, browser.y_position)
browser.delete_cookies
# browser.set_timeout($timeout)

# Actions performed before each scenario
Before do |scenario|
  # Create browser instance variable
  @browser = browser
  browser.log.info('Starting the scenario: ' + "#{scenario.title}")
end

at_exit do
  puts 'Closing browser and session'
  browser.log.info('Quiting the browser at: ' + DateHelper.set_log_timestamp)
  browser.driver.quit
end
