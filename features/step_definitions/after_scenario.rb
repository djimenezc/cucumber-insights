After do
  #clean browser storage
  @browser.log.debug 'Cleaning browser storage'
  page.execute_script('if (localStorage && localStorage.clear) localStorage.clear()')
  page.execute_script('if (sessionStorage && sessionStorage.clear) sessionStorage.clear()')
end