# frozen_string_literal: true

class Image < ApplicationRecord
  include SluggedToParam
  extend ActiveModel::Callbacks

  has_one_attached :file
  before_validation :create_slug

  validates :owner, :description, :slug, presence: true
  validate :valid_file?

  def content_type
    file&.blob&.content_type
  end

  def width
    file&.metadata&.dig(:width)
  end

  def height
    file&.metadata&.dig(:height)
  end

  private
  def create_slug
    self.slug ||= ::Slugfy.call(self.class)
  end

  def valid_file?
    errors.add(:file, :blank) and return unless file.attached?
    errors.add(:file, :wrong_type) unless file.image?
  end
end
