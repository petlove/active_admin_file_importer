# frozen_string_literal: true

config.include FactoryBot::Syntax::Methods

config.before(:suite) do
  FactoryBot.find_definitions
end
