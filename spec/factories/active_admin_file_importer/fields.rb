# frozen_string_literal: true

FactoryBot.define do
  factory :aafi_field, class: ActiveAdminFileImporter::Field do
    initialize_with { new('amount', '10,00') }

    name { 'amount' }
    raw { '10,00' }
    processed { 10.0 }
    hidden { false }
  end
end
