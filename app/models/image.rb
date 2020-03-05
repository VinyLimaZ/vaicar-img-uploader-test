# frozen_string_literal: true

class Image < ApplicationRecord
  include SluggedToParam

  has_one_attached :file
  before_save :create_slug

  validates :owner, :description, presence: true
  validate :ensure_has_file

  private

  def create_slug
    self.slug = ::Slugfy.call(self.class)
  end

  def ensure_has_file
    return if self.file.attached?

    self.errors.add(:file, :blank)
  end
end
