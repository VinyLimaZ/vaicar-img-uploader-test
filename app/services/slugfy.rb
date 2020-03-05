# frozen_string_literal: true
module Slugfy
  class << self
    def call(klass)
      @klass = klass
      slugfy
    end

    private

    def slugfy
      slug = generate_slug until valid_slug?(slug)
      slug
    end

    def generate_slug
      SecureRandom.uuid
    end

    def valid_slug?(slug)
      @klass.find_by(slug: slug).blank?
    end
  end
end
