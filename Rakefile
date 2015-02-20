require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'


task default: %w[features]

# namespace :features do

# task :test do

ENV['CONTROLLER'] = ENV['CONTROLLER'] ? ENV['CONTROLLER'] : 'chrome'

task :features do |t|

  unless ARGV[1].nil? || ARGV[1].include?('tags=')
    tags = ARGV[1].gsub(/.+=/, '')
  end

  puts "Running task #{t} with tags: #{tags}"

  Cucumber::Rake::Task.new(:features) do |t|

    # t.profile = 'webrat'
    t.cucumber_opts = %w(features --format html --out reports/report.html --format pretty)

    t.cucumber_opts.push('--tags', tags) unless tags.nil?
  end
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