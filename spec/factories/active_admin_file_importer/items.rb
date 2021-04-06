# frozen_string_literal: true

FactoryBot.define do
  factory :aafi_item, class: ActiveAdminFileImporter::Item do
    initialize_with { new({}) }

    number { 1 }
    fields { build_list :aafi_field, 3 }

    trait :warning do
      warning { 'Some warning' }
    end

    trait :errored do
      warning { 'Some error' }
    end
  end
end
