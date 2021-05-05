# frozen_string_literal: true

module ActiveAdminFileImporter
  module Parsers
    class Base
      attr_accessor :settings

      def initialize(params = {})
        @settings = params
      end
    end
  end
end
