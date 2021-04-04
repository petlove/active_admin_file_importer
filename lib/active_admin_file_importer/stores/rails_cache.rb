# frozen_string_literal: true

module ActiveAdminFileImporter
  module Stores
    class RailsCache < Base
      ONE_DAY = 86_400

      def find!(execution_id)
        Rails.cache.read(key(:execution, execution_id))
      end

      def save!(execution)
        Rails.cache.write(key(:execution, execution.id), execution)
      end

      private

      def key(kind, id)
        "#{ActiveAdminFileImporter::Core.gem_name}_#{kind}_#{id}"
      end
    end
  end
end
