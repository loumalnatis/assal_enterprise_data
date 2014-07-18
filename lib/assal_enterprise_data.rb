require 'assal_enterprise_data/context/find_employee'

module AssalEnterpriseData

  class << self
    attr_accessor :database_connection

    def migration_folder
      File.expand_path '../db/migrate', File.dirname(__FILE__)
    end

    def find_employee(employee_id)
      AssalEnterpriseData::Context::FindEmployee.new(employee_repo).call(employee_id)
    end

    private

    def employee_repo
      AssalEnterpriseData::Repository::Employee.new(database_connection)
    end
  end
end
