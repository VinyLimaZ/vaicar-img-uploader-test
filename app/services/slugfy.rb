# frozen_string_literal: true

module Slugfy
  class << self
    def call(klass)
      @klass = klass
      slugfy
    end

    private

    def slugfy
      loop do
        slug = generate_slug

        break if valid_slug?(slug)
      end
      slug
    end

    def generate_slug
      SecureRandom.uuid
    end

    def valid_slug?(slug)
      @klass.find_by_slug(slug).count.zero?
    end
  end
end
