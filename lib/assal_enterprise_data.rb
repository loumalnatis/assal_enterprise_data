require 'assal_enterprise_data/context/find_employee_name'
require 'assal_enterprise_data/context/find_employee_rates'

module AssalEnterpriseData

  class << self
    attr_accessor :database_connection

    def migration_folder
      File.expand_path '../db/migrate', File.dirname(__FILE__)
    end

    def find_employee_name(employee_id)
      AssalEnterpriseData::Context::FindEmployeeName.new(employee_repo).call(employee_id)
    end

    def find_employee_rates(employee_id)
      AssalEnterpriseData::Context::FindEmployeeRates.new(employee_repo).call(employee_id)
    end

    private

    def employee_repo
      AssalEnterpriseData::Repository::Employee.new(database_connection)
    end
  end
end
