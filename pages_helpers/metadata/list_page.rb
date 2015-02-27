module Metadata
  class ListPage < Metadata::BasePage
    def edit_item(item_name)
      filter_select_item(item_name)
      page.find('a.btn', :text => 'Edit').click
    end

    def filter_select_item(filter_text)
      filter_items(filter_text)
      page.first('table tr td a').click
    end

    def filter_edit_item(filter_text)
      filter_items(filter_text)
      page.first('table tr td a[title=Edit]').click
    end

    def filter_items(filter_text)
      @scenario.fill_in 'Search', :with => filter_text
    end
  end
end