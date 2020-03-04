# frozen_string_literal: true

module SluggedToParam
  included do
    def to_param
      slug
    end
  end
end
