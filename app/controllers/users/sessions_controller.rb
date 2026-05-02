class Users::SessionsController < Devise::SessionsController

  def guest_sign_in
    user = User.find_or_create_by(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.name = "ゲストユーザー" # ←ユーザー名を設定している場合は追加
    end
    sign_in user # ← Deviseのログインメソッド
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end

  # ・・・ (Rails7へDviseを導入する際に追記した内容) ・・・

end