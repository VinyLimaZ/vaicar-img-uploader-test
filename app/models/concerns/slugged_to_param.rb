# frozen_string_literal: true

module SluggedToParam
  extend ActiveSupport::Concern

  included do
    def to_param
      slug
    end
  end
end
