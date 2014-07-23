require 'assal_enterprise_data/context/find_by_employee_id'

module AssalEnterpriseData

  class << self
    attr_accessor :database_connection

    def migration_folder
      File.expand_path '../db/migrate', File.dirname(__FILE__)
    end

    def find_by_employee_id(employee_id)
      AssalEnterpriseData::Context::FindByEmployeeId.new(employee_repo).call(employee_id)
    end

    private

    def employee_repo
      AssalEnterpriseData::Repository::Employee.new(database_connection)
    end
  end
end
