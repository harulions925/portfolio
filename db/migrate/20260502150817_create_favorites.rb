class CreateFavorites < ActiveRecord::Migration[7.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :study_log_id

      t.timestamps
    end
  end
end
