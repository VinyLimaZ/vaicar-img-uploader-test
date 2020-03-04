module SluggedToParam
  included do
    def to_param
      slug
    end
  end
end
