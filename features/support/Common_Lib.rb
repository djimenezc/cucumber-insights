require 'rubygems'
require 'selenium-webdriver'

module Common_functions

  $element_timeout=2

  def wait_for_element(how, objObject, timeOut=$element_timeout)

    begin
      wait_for_it = Selenium::WebDriver::Wait.new(:timeout => timeOut)
      case how
        when 'content'
          wait_for_it.until { page.driver.browser.find_element(:xpath, "//*[contains(text(),'#{objObject}')]").displayed? }
          str_details = 'Content ' + objObject + ' found'
          puts str_details
        else
          wait_for_it.until { page.driver.browser.find_element(how, objObject).displayed? }
          str_details = 'Object ' + objObject + ' found'
          puts str_details
      end
      sleep 5
    rescue Exception => e
      puts e
    end
  end

  def embed_image(image_title='SCREENSHOT')
    encoded_img = @browser.driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}", 'image/png', image_title)
  end

  def wait_for_ajax(timeout=Capybara.default_wait_time)

    @browser.log.info("wait_for_ajax timeout #{timeout}")

    Timeout.timeout(timeout) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
  # RSpec.configure do |config|
  #   config.include wait_for_ajax, type: :feature
  # end

  def class_from_string(str)
    str.split('::').inject(Object) do |mod, class_name|
      mod.const_get(class_name)
    end
  end
end