class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_correct_user, only: [:show]
    def show
      @user = User.find(params[:id])
      @study_logs = @user.study_logs
      @favorited_items = current_user.favorited_items
    end

    private

    def ensure_correct_user
      user = User.find_by(id: params[:id])

      if user.nil?
        redirect_to user_path(current_user), alert: "ユーザーが見つかりません"
      elsif user.id != current_user.id
        redirect_to user_path(current_user), alert: "他のユーザーのページは表示できません"
      end
    end
end
