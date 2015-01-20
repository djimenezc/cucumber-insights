require 'rubygems'
require 'selenium-webdriver'
require 'minitest/autorun'

class SampleTest1 < MiniTest::Unit::TestCase
  def setup
    username=ENV['BS_USERNAME'] ? ENV['BS_USERNAME'] : 'david1347'
    key=ENV['BS_AUTHKEY'] ? ENV['BS_AUTHKEY'] : 'ntnBqvSYwxip1XQUnPM7'
    url = "http://#{username}:#{key}@hub.browserstack.com/wd/hub"
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
    capabilities.platform = :MAC
    @driver = Selenium::WebDriver.for(:remote, :url => url,  :desired_capabilities => capabilities)
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