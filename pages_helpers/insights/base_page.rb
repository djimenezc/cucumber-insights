# @author David Jimenez
module Insights
  class BasePage < Clavis::BasePage

    attr_reader :name, :driver, :log, :url, :page
    attr_accessor :score

    DELAY = 0.5

    # Initialises ClavisHomePage Class
    #
    # @param [String] name defines the name of the instance
    # @param [Object] driver defines the driver instance
    # @param [Object] log defines the log instance
    # @param [Object] url defines the clavis login url
    def initialize(name, driver, log, url, scenario, page)
      @name = name
      @driver = driver
      @log = log
      @url = url
      @scenario = scenario
      @page = page
    end

    def do_login(username_label)
      username, password = read_user_info_from_config(username_label)
      login(username, password)
    end

    def read_user_info_from_config(username_label)
      user_info_hash = CONFIG['USERS'][username_label.upcase]

      raise Exception("User #{username_label} Not Found") if user_info_hash.nil?

      username = user_info_hash['username']
      password = user_info_hash['password']

      return username, password
    end

    def back_previous_page
      page.evaluate_script('window.history.back()')
    end

    def get_filter_summary_node

      @page.find('.filters .filter_list .filter_summary')
    end

    def get_filter_summary

      self.get_filter_summary_node.text.split(';')
    end

    def wait_delay (delay= DELAY)
      sleep delay
    end
  end
end