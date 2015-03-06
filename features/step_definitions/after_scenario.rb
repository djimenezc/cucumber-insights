After do |scenario|
  #clean browser storage
  @browser.log.debug 'Cleaning browser storage'
  page.execute_script('if (localStorage && localStorage.clear) localStorage.clear()')
  page.execute_script('if (sessionStorage && sessionStorage.clear) sessionStorage.clear()')

  if CONFIG['RECORD_VIDEO?'] && !@browser.headless.nil?

    # if scenario.failed?
    @browser.log.debug 'Stopping and keeping video'
    @browser.headless.video.stop_and_save(video_path(scenario))
    # else
    #   @browser.log.debug 'Stopping video'
    #   @browser.headless.video.stop_and_discard
    # end
  end

end

def video_path(scenario)
  "videos/#{scenario.name.split.join('_')}.mov"
end