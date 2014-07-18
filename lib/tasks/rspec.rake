require 'rspec/core/rake_task'

namespace :rspec do
  desc "Setup the rspec environment"
  task :setup do
    ENV['RACK_ENV'] = "test"
  end
end

desc 'run all rspec specs'
RSpec::Core::RakeTask.new(:spec => 'rspec:setup')
