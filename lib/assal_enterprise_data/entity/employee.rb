module AssalEnterpriseData
  module Entity
    Employee = Struct.new(:emp_date, :emp_first_name, :emp_last_name, :emp_mi, :emp_id) do
      def initialize(fields)
        super(*fields.values_at(*members))
      end
    end
  end
end
