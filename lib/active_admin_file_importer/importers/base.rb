# frozen_string_literal: true

module ActiveAdminFileImporter
  module Importers
    class Base
      def initialize(execution)
        @execution = execution
      end
    end
  end
end
