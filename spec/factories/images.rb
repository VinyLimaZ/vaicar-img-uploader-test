# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    description { 'MyText' }
    owner { 'MyString' }
    path { 'MyText' }
    slug { 'MyString' }
  end
end
