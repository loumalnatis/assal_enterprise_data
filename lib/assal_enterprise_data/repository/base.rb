module AssalEnterpriseData
  module Repository
    class Base
      def initialize(db_connection)
        @db_connection = db_connection
      end

      def dataset
        @db_connection.from(table_name)
      end

      def table_name
        raise AssalEnterpriseData::Errors::InterfaceError.new, "Sub class must implement this method, it should return a symbol"
      end
    end
  end
end
