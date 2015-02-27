module Metadata
  class HomePage < Metadata::BasePage
    def initialize(driver, log, url, scenario)
      super('metadata_home_page', driver, log, url, scenario)
    end
  end
end