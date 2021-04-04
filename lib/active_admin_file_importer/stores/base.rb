# frozen_string_literal: true

module ActiveAdminFileImporter
  module Stores
    class Base
      def find!(_execution_id)
        nil
      end

      def save!(_execution); end
    end
  end
end
