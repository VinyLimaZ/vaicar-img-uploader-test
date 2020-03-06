# frozen_string_literal: true

class Image < ApplicationRecord
  include SluggedToParam
  extend ActiveModel::Callbacks

  has_one_attached :file
  before_validation :create_slug

  validates :owner, :description, :slug, presence: true
  validate :ensure_has_file

  private

  def create_slug
    self.slug ||= ::Slugfy.call(self.class)
  end

  def ensure_has_file
    return if file.attached?

    errors.add(:file, :blank)
  end
end
