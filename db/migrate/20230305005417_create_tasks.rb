class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :course, null: false, foreign_key: true
      t.string :description
      t.string :task_note, limit: 3
      t.integer :limit_note, null: false, default: 100

      t.timestamps
    end
  end
end
