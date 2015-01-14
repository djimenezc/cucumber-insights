require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require File.expand_path('../Common_Lib',__FILE__) #require

include RSpec::Matchers
include Common_functions

$timeout = 50
Capybara.configure do |capybara|
  browserId='firefox'

  Capybara.register_driver :selenium_ff do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end
  capybara.default_driver = :selenium_ff #set the browser you want to run the test on
  capybara.run_server = false
  #capybara.app_host ='https://www.youtube.com' #if you have your own project, you can set your own app_host here.

end

RSpec.configure do |config|
  config.include Capybara::DSL
end
