# いいね機能についてのコントローラー
class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @study_log = StudyLog.find(params[:study_log_id])
    current_user.favorites.create(study_log: @study_log)

    redirect_to study_log_path(@study_log)
  end

  def destroy
    @study_log = StudyLog.find(params[:study_log_id])
    favorite = current_user.favorites.find_by(study_log: @study_log)
    favorite.destroy if favorite

    redirect_to study_log_path(@study_log)
  end
end
