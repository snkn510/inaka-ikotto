class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @events = @user.events
  end

  def edit
    # 編集ページの処理を実装
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :occupation, :language, :profile, :avatar)
  end

end
