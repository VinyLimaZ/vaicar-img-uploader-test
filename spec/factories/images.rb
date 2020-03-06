# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    description { Faker::Quote.matz }
    owner { Faker::TvShows::BreakingBad.character }
  end
end
