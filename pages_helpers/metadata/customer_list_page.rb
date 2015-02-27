module Metadata
  class CustomerListPage < Metadata::ListPage
    def initialize(driver, log, url, scenario, page)
      super('metadata_customer_list_page', driver, log, url, scenario, page)
    end

    def configure_customer_report(customer_name, report_name, config_value)
      visit
      filter_select_item(customer_name)
      page.find('button.btn', :text => 'Configure').click
      page.find('ul.dropdown-menu li a', :text => 'Reports').click

      #now we are on the list of reports filter edit time!
      filter_edit_item(report_name)

      page.fill_in 'customersreportsconfig[value]', :with => config_value
      page.find('button.btn', :text => 'Save').click
    end
  end
end