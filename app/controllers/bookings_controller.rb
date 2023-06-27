class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_event, only: [:index, :create]

  def index
    @booking_guest = BookingGuest.new
    return unless current_user == @event.user
    redirect_to root_path
  end

  def create
    @booking_guest = BookingGuest.new(booking_params)
    if @booking_guest.valid?
      pay_event
      @booking_guest.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def booking_params
    params.require(:booking_guest).permit(:last_name, :first_name, :phone_number, :email, :checkin, :checkout, :message, :adult, :child, :infant).merge(
      user_id: current_user.id, event_id: params[:event_id] , token: params[:token]
    )
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def pay_event
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] 
    
    event_price = (@event.price * (@booking_guest.adult.to_i + @booking_guest.child.to_i)).to_i

    Payjp::Charge.create(
      amount: event_price, 
      card: booking_params[:token], 
      currency: 'jpy'
    )
  end
  
  
end
