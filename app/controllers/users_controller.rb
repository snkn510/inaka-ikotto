class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @events = @user.events
  end
end
