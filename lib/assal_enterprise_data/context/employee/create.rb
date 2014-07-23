module AssalEnterpriseData
  module Context
    module Employee
      class Create
        def initialize(employee_repo)
          @employee_repo = employee_repo
        end

        def call(params)
          employee_repo.create!(params)
        end

        private

        attr_reader :employee_repo
      end
    end
  end
end
