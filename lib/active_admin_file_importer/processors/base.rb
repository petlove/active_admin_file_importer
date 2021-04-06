# frozen_string_literal: true

module ActiveAdminFileImporter
  module Processors
    class Base
      attr_accessor :item

      def initialize(item)
        @item = item
      end

      def perform!
        process!
      rescue ActiveAdminFileImporter::ProcessError => e
        error!(e.message)
      end

      def error!(message)
        @item.error = [@item.error, message].join("\n")
      end

      def warning!(message)
        @item.warning = [@item.warning, message].join("\n")
      end
    end
  end
end
