module AssalEnterpriseData
  module Context
    module Employee
      class FindByEmployeeId
        def initialize(employee_repo)
          @employee_repo = employee_repo
        end

        def call(employee_id)
          employee_repo.find_by_employee_id(employee_id)
        end

        private

        attr_reader :employee_repo
      end
    end
  end
end
