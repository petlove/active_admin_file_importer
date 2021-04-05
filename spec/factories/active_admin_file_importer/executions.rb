# frozen_string_literal: true

FactoryBot.define do
  factory :aafi_execution, class: ActiveAdminFileImporter::Execution do
    initialize_with { new(SecureRandom.hex(3).upcase) }

    factory :aafi_execution_with_items do
      transient do
        items { nil }
      end

      after :build do |object, options|
        items = FactoryBot.build_list(:aafi_item, 5) unless options.items

        object.build_items(items)
      end
    end
  end
end
