class Users::PasswordsController < Devise::PasswordsController
  before_action :ensure_general_user, only: :create

  def ensure_general_user
    if params[:user][:email].downcase == "guest@example.com" # パスワード再設定ページのフォームに入力されたメールアドレスはparams[:user][:email]で受け取れる
      redirect_to new_user_session_path, alert: "ゲストユーザーのパスワード再設定はできません"
    end
  end

end