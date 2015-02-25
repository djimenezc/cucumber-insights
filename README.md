





Run parallel test with headless driver with profile all:
CONTROLLER=selenium parallel_cucumber -n 3 features -o '-p all'

Run @l1 features in browserstack and Mac platform (rake)
BROWSERSTACK=true SELENIUM_PLATFORM=MAC BS_AUTOMATE_PROJECT=insights-l1 bundle exec rake features tags=@l1

Run @l1 features with cucumber using headless driver
CONTROLLER=selenium cucumber --tags @l1

Run parallel test (2) of the features with @l1 and @l2 tags over chrome locally
CONTROLLER=chrome parallel_cucumber -n 2 features -o '--tags @l1,@l2'

