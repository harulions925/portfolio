class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @study_log = StudyLog.find(params[:study_log_id])
    current_user.favorites.create(study_log: @study_log)

    redirect_to "#{request.referer.split("#").first}#study_log_#{@study_log.id}", notice: "お気に入りに追加しました"
  end

  def destroy
    @study_log = StudyLog.find(params[:study_log_id])
    favorite = current_user.favorites.find_by(study_log: @study_log)
    favorite.destroy if favorite

    redirect_to "#{request.referer.split("#").first}#study_log_#{@study_log.id}", notice: "お気に入りを解除しました"
  end
end
