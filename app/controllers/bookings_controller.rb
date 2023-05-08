class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @event = Event.find(params[:event_id])

    @booking_guest = BookingGuest.new
    # return unless current_user == @event.user
    # redirect_to root_path
  end

  def create
    @booking_guest = BookingGuest.new(booking_params)
    @event = Event.find(params[:event_id])
    if @booking_guest.valid?
      # pay_item
      @booking_guest.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def booking_params
    params.require(:booking_guest).permit(:last_name, :first_name, :phone_number, :email, :date, :message).merge(
      user_id: current_user.id, event_id: params[:event_id] #, token: params[:token]
    )
  end
end
