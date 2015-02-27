class MetadataHomePage < MetadataBasePage
  def initialize(driver, log, url, scenario, username, password)
    super("metadata_home_page", driver, log, url, scenario, username, password)
  end
end