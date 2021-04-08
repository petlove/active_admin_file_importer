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
        @item.error!(message)
      end

      def warning!(message)
        @item.warning!(message)
      end
    end
  end
end
