# Assal Enterprise Data

Use this gem to access Assal Enterprise Data.

Right now it only reads from a database source. The source can be specified
by the app that is using it (for example, a sqlite DB or a mysql DB).

By segmentating this code out we disconnect our apps from the particulars
of Assal. This gem should only expose general interfaces to the public.

# Setup

First, add the gem to your Gemfile:

```ruby
gem 'assal_enterprise_data', :git => 'git@github.com:loumalnatis/assal_enterprise_data.git', :tag => 'v0.0.3'
```

Right now we don't have any kind of private gem server and so we just build directly from the git repo.

Once it is added you need to set the database connection. You should do this upon initialization of your app.
On rails you can add a new initializer under 'config/initializers' and add something like the following:

```ruby
require 'sequel'
require 'assal_enterprise_data/configuration'

if Rails.env.production?
  database_connection_opts = AssalEnterpriseRemoteConnectionConfiguration.connection_opts
else
  database_connection_opts = "sqlite://db/assal_enterprise.db"
end

AssalEnterpriseData::Configuration.configure do |c|
  c.database_connection  = Sequel.connect(database_connection_opts)
end
```

If you are using this with a system like Sinatra then you can do something similar upon
rackup.

# Usage

There are currently three methods available:

* find_by_employee_id(<id>) - returns the matching record for the employee's ID
* employee_create(<emp_data>) - creates a new record in the 'emp' table
* find_all_employees - Returns all employees in the 'emp' table

All can be accessed via the top-level module. For example: `AssalEnterpriseData.find_all_employees`

# Testing

To run tests use 'bundle exec rspec' in the root directory.
