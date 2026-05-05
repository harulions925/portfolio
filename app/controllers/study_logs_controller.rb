class StudyLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_study_log, only: [:show]
  before_action :set_current_user_study_log, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
    @study_logs = StudyLog.all

    if params[:category_id].present?
      @study_logs = @study_logs.where(category_id: params[:category_id])
    end

    if params[:keyword].present?
      keyword = "%#{params[:keyword]}%"

      @study_logs = @study_logs.where(
        "title LIKE ? OR content LIKE ?",
        keyword,
        keyword
      )
    end
  end

  def new
    @study_log = StudyLog.new
    @categories = Category.all
  end

  def create
    @study_log = current_user.study_logs.new(study_log_params)

    if @study_log.save
      flash[:notice] = "新規投稿の登録完了しました"
      redirect_to study_logs_path
    else
      @categories = Category.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @categories = Category.all
  end

  def update
    if @study_log.update(study_log_params)
      flash[:notice] = "更新しました"
      redirect_to @study_log
    else
      @categories = Category.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @study_log.destroy
    flash[:notice] = "削除しました"
    redirect_to study_logs_path
  end

  private

  def set_study_log
    @study_log = StudyLog.find(params[:id])
  end

  def set_current_user_study_log
    @study_log = current_user.study_logs.find(params[:id])
  end

  def study_log_params
    params
      .require(:study_log)
      .permit(:title, :content, :study_time, :study_date, :category_id)
  end
end
