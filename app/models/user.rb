class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader 

  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :language, presence: true

  has_many :events
  has_many :comments
  has_many :bookings
end
