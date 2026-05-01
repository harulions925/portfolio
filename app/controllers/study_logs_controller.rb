class StudyLogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @study_logs = StudyLog.all
  end

  def new
    @study_log = StudyLog.new
  end

  def create
    @study_log = current_user.study_logs.new(study_log_params)

    if @study_log.save
      flash[:notice] = "新規投稿の登録完了しました"
      redirect_to study_logs_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @study_log = StudyLog.find(params[:id])
  end

  def edit
    @study_log = current_user.study_logs.find(params[:id])
  end

  def update
    @study_log = current_user.study_logs.find(params[:id])

    if @study_log.update(study_log_params)
      flash[:notice] = "更新しました"
      redirect_to @study_log
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @study_log = StudyLog.find(params[:id])
    @study_log.destroy
    flash[:notice] = "削除しました"
    redirect_to :study_logs
  end

  private

  def study_log_params
    params
      .require(:study_log)
      .permit(:title, :content, :study_time, :study_date)
  end
end