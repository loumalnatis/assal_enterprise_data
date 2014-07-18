require 'database_cleaner'
require 'sequel'

TestDBConnection = Sequel.sqlite(:database => ':memory:')
Sequel.extension :migration
Sequel.default_timezone = :utc
Sequel::Migrator.apply(TestDBConnection, 'db/migrate')

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner[:sequel, {:connection => TestDBConnection}].start
  end

  config.after(:each) do
    DatabaseCleaner[:sequel, {:connection => TestDBConnection}].clean
  end
end

require 'coverage_report'
