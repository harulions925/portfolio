class CreateStudyLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :study_logs do |t|
      t.string :title
      t.text :content
      t.integer :study_time
      t.integer :user_id

      t.timestamps
    end
  end
end
