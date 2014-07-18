$:.unshift File.dirname(__FILE__) + '/lib'

# import other rake tasks
Dir.glob('lib/tasks/*.rake').each { |r| import r }

namespace :bundler do
  task :setup do
    require 'rubygems'
    require 'bundler/setup'
  end
end
