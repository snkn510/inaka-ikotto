class BookingGuest
  include ActiveModel::Model
  attr_accessor :user_id, :event_id, :last_name, :first_name, :phone_number, :email, :checkin, :checkout, :message, :adult, :child, :token

 with_options presence: true do
  # bookingモデルのバリデーション
  validates :user_id
  validates :event_id
  # guestモデルのバリデーション
  validates :last_name
  validates :first_name
  validates :phone_number, format: { with: /\A\d{10,11}\z/, allow_blank: true, message: 'is invalid' }
  validates :email
  validates :checkin
  validates :checkout
  validates :adult, numericality: { only_integer: true, message: 'Half-width number' }
  validates :child, numericality: { only_integer: true, message: 'Half-width number' }
  validates :token
  end

  def save
    # 予約情報を保存し、変数bookingに代入する
    booking = Booking.create(user_id: user_id, event_id: event_id)
    # ゲストの情報を保存する
    Guest.create(last_name: last_name, first_name: first_name,  phone_number: phone_number, email: email, checkin: checkin, checkout: checkout, message: message, adult: adult, child: child, booking_id: booking.id)
  end
end


