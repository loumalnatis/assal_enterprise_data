module AssalEnterpriseData
  module Entity
    Employee = Struct.new(
      :emp_date,
      :emp_first_name,
      :emp_last_name,
      :emp_mi,
      :emp_id,
      :emp_rate1,
      :emp_rate2,
      :emp_rate3,
      :emp_rate4,
      :emp_rate5
    ) do

      def initialize(fields)
        super(*fields.values_at(*members))
      end
    end
  end
end
