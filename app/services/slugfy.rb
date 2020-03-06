# frozen_string_literal: true

module Slugfy
  class << self
    def call(klass)
      @klass = klass
      slugfy
    end

    private
    def slugfy
      slug = generate_slug while invalid_slug?(slug)

      slug
    end

    def generate_slug
      SecureRandom.uuid
    end

    def invalid_slug?(slug)
      slug.blank? || @klass.exists?(slug: slug)
    end
  end
end
