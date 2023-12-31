# frozen_string_literal: true

# typed: false

class Event < ApplicationRecord
  extend T::Sig

  # Callbacks
  before_save :set_slug

  # ActiveRecord Associations
  has_many :registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :followers, through: :likes, source: :user
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_one_attached :main_image

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :description, presence: true, length: { minimum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validate :acceptable_image

  # Scopes
  scope :past, -> { where('starts_at < ?', Time.now).order('starts_at') }
  scope :upcoming, -> { where('starts_at > ?', Time.now).order('starts_at') }
  scope :free, -> { where(price: 0.0).order(:name) }
  scope :recent, ->(max = 3) { last(max) }

  sig { returns(T::Boolean) }
  def free?
    price.blank? || price&.zero?
  end

  sig { returns(T::Boolean) }
  def sold_out?
    (capacity.to_i - registrations.size).zero?
  end

  sig { returns(String) }
  def to_param
    name&.parameterize
  end

  sig { returns(String) }
  def set_slug
    self.slug = name.parameterize
  end

  def acceptable_image
    return unless main_image.attached?

    errors.add(:main_image, 'is too big') unless main_image.blob.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(main_image.content_type)

    errors.add(:main_image, 'must be a JPEG or PNG')
  end
end
