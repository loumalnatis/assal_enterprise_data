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

      def find_all
        employees = []

        dataset.each do |employee|
          employees << AssalEnterpriseData::Entity::Employee.new(employee)
        end

        employees
      end

      def create!(params)
        dataset.insert(params)
        AssalEnterpriseData::Entity::Employee.new(params)
      end

      private

      attr_reader :db_connection, :dataset
    end
  end
end
