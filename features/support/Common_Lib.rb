require 'rubygems'
require 'selenium-webdriver'

module Common_functions

  $element_timeout=2

  def wait_for_element how, objObject, timeOut=$element_timeout

    begin
      wait_for_it = Selenium::WebDriver::Wait.new(:timeout => timeOut)
      case how
        when 'content'
          wait_for_it.until { page.driver.browser.find_element(:xpath, "//*[contains(text(),'#{objObject}')]").displayed?}
          strDetails = 'Content ' + objObject + ' found'
          puts strDetails
        else
          wait_for_it.until { page.driver.browser.find_element(how, objObject).displayed?}
          strDetails = 'Object ' + objObject + ' found'
          puts strDetails
      end
      sleep 5
    rescue Exception => e
      puts e
    end
  end

end