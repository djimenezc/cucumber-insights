module Metadata
  class CustomerListPage < Metadata::ListPage
    def initialize(driver, log, url, scenario, page)
      super('metadata_customer_list_page', driver, log, url, scenario, page)
    end
  end
end