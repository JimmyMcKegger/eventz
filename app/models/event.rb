# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :registrations, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :followers, through: :likes, source: :user

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  validates :name, :description, :location, presence: true

  validates :description, length: { minimum: 25 }

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validates :capacity, numericality: { only_integer: true, greater_than: 0 }

  validates :image_file_name, format: { with: /\w+\.(jpg|png)\z/i, message: 'Must be a valid JPG or PNG image' }

  def free?
    price.blank? || price.zero?
  end


  # def self.past
  #  where('starts_at < ?', Time.now).order('starts_at')
  # end

  scope :past, -> { where('starts_at < ?', Time.now).order('starts_at') }

  scope :upcoming, -> { where('starts_at > ?', Time.now).order('starts_at') }

  scope :free, -> { where(price: 0.0).order(:name) }

  scope :recent, ->(max=3) { past.limit(max) }

  def sold_out?
    (capacity - registrations.size).zero?
  end
end
