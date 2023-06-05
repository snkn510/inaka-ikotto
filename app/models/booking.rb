class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one :guest, dependent: :destroy
end
