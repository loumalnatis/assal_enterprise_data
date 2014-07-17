require 'assal_enterprise_data'
require 'forwardable'

module AssalEnterpriseData
  class Configuration
    class << self

      extend Forwardable
      def_delegators :client, :database_connection=

      def configure(&block)
        yield(self)
      end

      private

      def client
        AssalEnterpriseData
      end
    end
  end
end
