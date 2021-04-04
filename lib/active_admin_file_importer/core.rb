# frozen_string_literal: true

require 'securerandom'

module ActiveAdminFileImporter
  module Core
    module_function

    def gem_name
      'active_admin_file_importer'
    end

    def process!(type, params)
      execution = ActiveAdminFileImporter::Execution.new(SecureRandom.hex(3).upcase)
      type
        .parser
        .parse!(params)
        .each_with_index
        .map  { |fields, index| Item.new(number: index + 1, fields: fields) }
        .each { |item| type.processor&.new(item)&.perform! }
        .tap  { |items| execution.build_items(items) }

      type.store.save!(execution)
      execution.id
    end

    def confirm!(type, params)
      type
        .store
        .find!(params[:id])
        .then { type.importer.new(_1).import! }
        .then { (_1.is_a?(String) && _1) || 'Importação executada com sucesso' }
    end
  end
end
