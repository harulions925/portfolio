class StudyLogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all
    @study_logs = StudyLog.all

    if params[:category_id].present?
        @study_logs = @study_logs.where(category_id: params[:category_id])
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
      p @study_log.errors.full_messages
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @study_log = StudyLog.find(params[:id])
  end

  def edit
    @study_log = current_user.study_logs.find(params[:id])
    @categories = Category.all
  end

  def update
    @study_log = current_user.study_logs.find(params[:id])

    if @study_log.update(study_log_params)
      flash[:notice] = "更新しました"
      redirect_to @study_log
    else
      @categories = Category.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @study_log = current_user.study_logs.find(params[:id])
    @study_log.destroy
    flash[:notice] = "削除しました"
    redirect_to :study_logs
  end

  private

  def study_log_params
    params
      .require(:study_log)
      .permit(:title, :content, :study_time, :study_date, :category_id)
  end
end