class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_one_attached :avatar

  validates :password, presence: true, on: :create
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :language, presence: true
  validates :avatar, presence: true
  validates :avatar_cache, presence: true

  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :events
  has_many :comments
  has_many :bookings
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
end
