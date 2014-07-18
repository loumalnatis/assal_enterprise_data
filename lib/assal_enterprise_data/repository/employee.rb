require 'assal_enterprise_data/entity/employee'

module AssalEnterpriseData
  module Repository
    class Employee
      def initialize(db_connection)
        @db_connection = db_connection
        @dataset = db_connection.from(:emp)
      end

      def find_by_employee_id(employee_id)
        employee = dataset.where(:emp_id => employee_id).first

        if employee
          AssalEnterpriseData::Entity::Employee.new(employee)
        end
      end

      private

      attr_reader :db_connection, :dataset
    end
  end
end
