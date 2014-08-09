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
        super(*clean(fields).values_at(*members))
      end

      def clean(fields)
        cleaned_fields = {}

        fields.each_pair do |key, value|
          cleaned_fields.merge!({key.downcase => value})
        end

        cleaned_fields
      end
    end
  end
end
