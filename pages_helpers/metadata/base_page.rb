# @author Lee Farrell
module Metadata
  class BasePage < Clavis::BasePage

    attr_reader :name, :driver, :log, :url, :scenario, :page

    # Initialises BasePage Class
    #
    # @param [String] name defines the name of the instance
    # @param [Object] driver defines the driver instance
    # @param [Object] log defines the log instance
    # @param [String] url defines the clavis login url
    # @param [Object] scenario defines the currently running scenario
    def initialize(name, driver, log, url, scenario, page)
      @name = name
      @driver = driver
      @log = log
      @url = url
      @scenario = scenario
      @page = page
    end

  end
end