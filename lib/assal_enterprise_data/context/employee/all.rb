module AssalEnterpriseData
  module Context
    module Employee
      class All
        def initialize(employee_repo)
          @employee_repo = employee_repo
        end

        def call
          employee_repo.find_all
        end

        attr_reader :employee_repo
      end
    end
  end
end
