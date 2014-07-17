require 'database_cleaner'
require 'sequel'

TestDBConnection = Sequel.sqlite(:database => ':memory:')
Sequel.extension :migration
Sequel.default_timezone = :utc
Sequel::Migrator.apply(TestDBConnection, 'db/migrate')

require 'coverage_report'
