class AddStudyDateToStudyLogs < ActiveRecord::Migration[7.2]
  def change
    add_column :study_logs, :study_date, :date
  end
end
