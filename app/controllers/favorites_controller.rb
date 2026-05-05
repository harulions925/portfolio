class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_study_log

  def create
    current_user.favorites.create(study_log: @study_log)

    redirect_to "#{request.referer.split("#").first}#study_log_#{@study_log.id}",
                notice: "お気に入りに追加しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(study_log: @study_log)
    favorite.destroy if favorite

    redirect_to "#{request.referer.split("#").first}#study_log_#{@study_log.id}",
                notice: "お気に入りを解除しました"
  end

  private

  def set_study_log
    @study_log = StudyLog.find(params[:study_log_id])
  end
end
