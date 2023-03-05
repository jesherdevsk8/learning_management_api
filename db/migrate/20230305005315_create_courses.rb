class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.references :instructor, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true
      t.references :teaching_level, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
