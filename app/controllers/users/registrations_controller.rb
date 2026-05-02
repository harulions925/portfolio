class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_general_user, only: [:update, :destroy]

  def ensure_general_user
    if resource.email == "guest@example.com"
      redirect_to root_path, alert: "ゲストユーザーの変更・削除はできません"
    end
  end

  # ・・・ (Rails7へDviseを導入する際に追記した内容) ・・・

end