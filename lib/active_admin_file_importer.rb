# frozen_string_literal: true

require 'active_admin_file_importer/version'
require 'active_admin_file_importer/engine'
require 'active_admin_file_importer/core'
require 'active_admin_file_importer/execution'
require 'active_admin_file_importer/item'

require 'active_admin_file_importer/types/base'
require 'active_admin_file_importer/types/confirmation_page'

require 'active_admin_file_importer/parsers/base'
require 'active_admin_file_importer/parsers/csv'

require 'active_admin_file_importer/stores/base'
require 'active_admin_file_importer/stores/rails_cache'

require 'active_admin_file_importer/processors/base'
require 'active_admin_file_importer/importers/base'
require 'active_admin_file_importer/errors/process_error'

module ActiveAdminFileImporter
  def file_import(type, params)
    type.new(self, params).build!
  end
end

ActiveAdmin::ResourceDSL.include(ActiveAdminFileImporter)