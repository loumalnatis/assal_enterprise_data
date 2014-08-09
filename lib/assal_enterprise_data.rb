require 'assal_enterprise_data/context/employee/find_by_employee_id'
require 'assal_enterprise_data/context/employee/create'
require 'assal_enterprise_data/context/employee/all'
require 'assal_enterprise_data/repository/employee'

module AssalEnterpriseData

  class << self
    attr_accessor :database_connection

    def migration_folder
      File.expand_path '../db/migrate', File.dirname(__FILE__)
    end

    def find_by_employee_id(employee_id)
      AssalEnterpriseData::Context::Employee::FindByEmployeeId.new(employee_repo).call(employee_id)
    end

    def employee_create(params)
      AssalEnterpriseData::Context::Employee::Create.new(employee_repo).call(params)
    end

    def find_all_employees
      AssalEnterpriseData::Context::Employee::All.new(employee_repo).call
    end

    private

    def employee_repo
      AssalEnterpriseData::Repository::Employee.new(database_connection)
    end
  end
end
