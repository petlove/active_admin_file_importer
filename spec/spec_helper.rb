# frozen_string_literal: true

require 'bundler/setup'
require 'support/configs/simple_cov_config'
SimpleCovConfig.configure

require 'active_admin_file_importer'
require 'pry'

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
