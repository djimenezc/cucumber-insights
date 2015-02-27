module Metadata
  class LoginPage < Metadata::BasePage

    attr_reader :username, :password

    def initialize(driver, log, url, scenario, page, username, password)
      super('metadata_login_page', driver, log, url, scenario, page)
      @username = username
      @password = password
    end

    def do_login
      login(@username, @password)
    end
  end
end