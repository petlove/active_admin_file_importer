# frozen_string_literal: true

module ActiveAdminFileImporter
  module Types
    class Base
      attr_accessor :resource, :id, :importer, :store, :parser, :processor, :name, :label, :admin, :link

      def initialize(resource, params)
        @resource = resource
        @importer = params[:importer]
        @store = params[:store]
        @parser = params[:parser]
        @processor = params[:processor]
        @name = params[:name]
        @label = params[:label]
        @admin = params[:admin]
        @link = params[:link].nil? ? true : params[:link]
      end

      private

      def admin_pluralized
        @admin.to_s.pluralize.to_sym
      end

      def build_name(*names)
        names.compact.join('_').to_sym
      end
    end
  end
end
