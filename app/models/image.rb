class Image < ApplicationRecord
  include SluggedToParam

  has_one_attached :file
  before_save :create_slug

  private
  def create_slug
    Slugfy.call(self.class)
  end
end
