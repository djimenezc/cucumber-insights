require 'rubygems'
require 'selenium-webdriver'
require 'minitest/autorun'

class SampleTest < Minitest::Unit::TestCase
  def setup
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['browser.download.folderList'] = 0
    profile['browser.download.manager.showWhenStarting'] = false
    profile['browser.download.manager.focusWhenStarting'] = false
    profile['browser.download.useDownloadDir'] = true
    profile['browser.helperApps.alwaysAsk.force'] = false
    profile['browser.download.manager.alertOnEXEOpen'] = false
    profile['browser.download.manager.closeWhenDone'] = true
    profile['browser.download.manager.showAlertOnComplete'] = false
    profile['browser.download.manager.useWindow'] = false
# you will need to find the content-type of your app and set it here.
    profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/octet-stream'

    caps = Selenium::WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile)
    caps['browserstack.debug'] = 'true'

    url = 'http://david1347:ntnBqvSYwxip1XQUnPM7@hub.browserstack.com/wd/hub'
    @driver = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => caps)
  end

  def test_post
    @driver.navigate.to 'http://www.google.com'
    element = @driver.find_element(:name, 'q')
    element.send_keys 'BrowserStack'
    element.submit
    assert_equal(@driver.title, 'BrowserStack - Google Search')
  end

  def teardown
    @driver.quit
  end
end