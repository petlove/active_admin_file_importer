# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'active_admin_file_importer/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_admin_file_importer'
  spec.version       = ActiveAdminFileImporter::VERSION
  spec.authors       = ['linqueta']
  spec.email         = ['lincolnrodrs@gmail.com']

  spec.summary       = 'my_gem'
  spec.description   = 'my_gem'
  spec.homepage      = 'https://https://github.com/petlove/active_admin_file_importer'
  spec.license       = 'MIT'

  spec.files         = Dir['{app,config,lib}/**/*', 'spec/factories/**/*', 'CHANGELOG.md', 'MIT-LICENSE', 'README.md']

  spec.add_runtime_dependency 'activeadmin'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'factory_bot', '>= 6.1.0'
  spec.add_development_dependency 'pry-byebug', '>= 3.7.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '>= 0.74.0'
  spec.add_development_dependency 'rubocop-performance', '>= 1.4.1'
  spec.add_development_dependency 'simplecov', '>= 0.17.0'
  spec.add_development_dependency 'simplecov-console', '>= 0.5.0'
end
