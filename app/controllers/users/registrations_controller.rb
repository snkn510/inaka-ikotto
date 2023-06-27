class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # アカウント登録後のリダイレクト先
  def after_sign_up_path_for(_resource)
    root_path
  end

  # パスワードなしで更新できるメソッド
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # アカウント編集後のリダイレクト先
  def after_update_path_for(resource)
    user_path(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :occupation, :language, :profile, :avatar,
                                 :avatar_cache)
  end

  def account_update_params
    params.require(:user).permit(:name, :occupation, :language, :profile, :avatar, :avatar_cache)
  end
end
