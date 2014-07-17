module AssalEnterpriseData
  module Context
    class FindEmployeeRates
      def initialize(employee_repo)
        @employee_repo = employee_repo
      end

      def call(employee_id)

      end

      private

      attr_reader :employee_repo
    end
  end
end
