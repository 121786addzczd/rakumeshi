class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :email, :image])
  end

  # ログイン後マイページにリダイレクト
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  # ログアウト後サインインページにリダイレクト
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

end
