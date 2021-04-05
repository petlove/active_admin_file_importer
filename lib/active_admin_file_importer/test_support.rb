# frozen_string_literal: true

module ActiveAdminFileImporter
  class TestSupport
    FactoryBot.definition_file_paths = [File.expand_path('../../spec/factories', __dir__)]
    FactoryBot.find_definitions
  end
end
