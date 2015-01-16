require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'


task default: %w[features]

# namespace :features do

  # task :test do

ENV['CONTROLLER'] = 'chrome'

    puts 'Starting features testing'

    Cucumber::Rake::Task.new(:features) do |t|
      # t.profile = 'webrat'
      t.cucumber_opts = 'features --format html --out reports/report.html --format pretty '
      puts 'hello cucumber'
    end

    puts 'Exiting features testing'
  # end

# end
#
begin

rescue LoadError
  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end

# task :features => 'test'