# frozen_string_literal: true

FactoryBot.define do
  factory :aafi_item, class: ActiveAdminFileImporter::Item do
    initialize_with { new({}) }

    number { 1 }
    fields do
      { 'payment_id' => { 'display' => '10', 'raw' => 10 }, 'amount' => { 'display' => '20,0', 'raw' => 20.0 } }
    end

    trait :warning do
      warning { 'Some warning' }
    end

    trait :errored do
      warning { 'Some error' }
    end
  end
end
