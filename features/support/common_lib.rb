require 'rubygems'
require 'selenium-webdriver'

module Common_functions

  $element_timeout=2

  # def wait_for_element(how, obj, timeout=$element_timeout)
  #
  #   begin
  #     wait_for_it = Selenium::WebDriver::Wait.new(:timeout => timeout)
  #     case how
  #       when 'content'
  #         wait_for_it.until { page.driver.browser.find_element(:xpath, "//*[contains(text(),'#{obj}')]").displayed? }
  #         str_details = 'Content ' + obj + ' found'
  #         puts str_details
  #       else
  #         wait_for_it.until { page.driver.browser.find_element(how, obj).displayed? }
  #         str_details = 'Object ' + obj + ' found'
  #         puts str_details
  #     end
  #     sleep 5
  #   rescue Exception => e
  #     puts e
  #   end
  # end

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

  def class_from_string(str)
    str.split('::').inject(Object) do |mod, class_name|
      mod.const_get(class_name)
    end
  end

  def verify_loading_mask_hidden (timeout=20)

    #in some environments the loading mask is displayed too fast
    # page.should have_css('#loading')
    wait_for_ajax timeout
    # noinspection RubyResolve

    # noinspection RubyResolve
    page.should have_no_css('#loading')
  end
end