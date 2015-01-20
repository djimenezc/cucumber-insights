require 'rubygems'
require 'selenium-webdriver'
require './fast_selenium'

# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new

# caps['browser'] = 'IE'
# caps['browser_version'] = '7.0'
# caps['os'] = 'Windows'
# caps['os_version'] = 'XP'

caps['build'] = 'version1'
caps['project'] = 'insights-test'

caps[:browserName] = 'iPad'
caps[:platform] = 'MAC'
caps['device'] = 'iPad mini Retina'

# caps['browserstack.local'] = 'true'

caps['browserstack.debug'] = 'true'
caps['name'] = 'Testing Selenium 2 with Ruby on BrowserStack'

driver = Selenium::WebDriver.for(:remote,
                                 :url => 'http://david1347:ntnBqvSYwxip1XQUnPM7@hub.browserstack.com/wd/hub',
                                 :desired_capabilities => caps)
driver.navigate.to 'http://www.google.com/ncr'
element = driver.find_element(:name, 'q')
element.send_keys 'BrowserStack'
element.submit
puts driver.title
driver.quit