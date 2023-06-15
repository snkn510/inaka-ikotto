class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_event, only: [:edit, :show, :update, :destroy, :move_to_index]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  

  def index
    @events = Event.includes(:user).order("created_at DESC")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @event.comments.includes(:user)
    @event = Event.find(params[:id])
    
    # 住所の整形
    address_parts = @event.address.split(" ")
    @street = address_parts[0..-2].join(" ")
    
    @locations = [
      { "lat" => @event.latitude, "lng" => @event.longitude }
    ]
  end
  

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end

  def destroy
    @event.bookings.destroy_all
    @event.destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :catch_copy, :concept, :price, :address, :latitude, :longitude, images: []).merge(user_id: current_user.id)
  end

  def set_event
    @event = Event.find (params[:id])
  end

  def move_to_index
    if !(user_signed_in? && current_user.id == @event.user_id)
      redirect_to action: :index
    end
  end
end

