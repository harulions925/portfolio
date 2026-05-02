class AddCategoryIdToStudyLogs < ActiveRecord::Migration[7.2]
  def change
    add_column :study_logs, :category_id, :integer
  end
end
