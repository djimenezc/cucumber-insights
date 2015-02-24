require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task default: %w[features]

ENV['CONTROLLER'] = ENV['CONTROLLER'] ? ENV['CONTROLLER'] : 'chrome'
ENV['FORMAT'] = ENV['FORMAT'] ? ENV['FORMAT'] : 'html'
OUTPUT = "reports/report.#{ENV['FORMAT']}"

task :features do |t|

  unless ARGV[1].nil? || !ARGV[1].include?('tags=')
    tags = ARGV[1].gsub(/.+=/, '')
  end

  puts "Running task #{t} with tags: #{# noinspection RubyScope
       tags} format: #{ENV['FORMAT']} output: #{'OUTPUT'}"


  Cucumber::Rake::Task.new(:features) do |t|

    t.cucumber_opts = ['features', '--format', ENV['FORMAT'], '--out', OUTPUT, '--format', 'pretty']

    t.cucumber_opts.push('--tags', tags) unless tags.nil?
  end
end

begin

rescue LoadError
  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end
