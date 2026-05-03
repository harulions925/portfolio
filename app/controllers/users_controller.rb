class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @study_logs = @user.study_logs
      @favorited_items = current_user.favorited_items
    end
end
