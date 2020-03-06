# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    description { Faker::Quote.matz }
    owner { Faker::Name.first_name }

    trait :with_image do
      after(:build) do |image|
        image.file.attach(
          filename: 'img.jpg',
          io: File.open(
            Rails.root.join(
              'spec', 'support', 'images', 'img_1.jpg'
            )
          )
        )
      end
    end
  end
end
