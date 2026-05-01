class StudyLogsController < ApplicationController
  def index
    @study_logs = StudyLog.all
  end

  def new
    @user = User.new
  end

  def create
  end
  
end
