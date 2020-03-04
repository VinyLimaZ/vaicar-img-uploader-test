module Slugfy
  class << self
    def call(klass)
      @klass = klass
      slugfy
    end

    private
    def slugfy
      slug = generate_slug

      while invalid_slug?(slug)
        slug = generate_slug
      end
    end

    def generate_slug
      SecureRandom.uuid
    end

    def invalid_slug?(slug)
      !@klass.find_by_slug(slug).count.zero?
    end
  end
end
