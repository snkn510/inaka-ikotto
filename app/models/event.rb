class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :images
  has_one :booking

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :images, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :images, length: { minimum: 1, maximum: 10, message: "は1枚以上10枚以下にしてください" }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end