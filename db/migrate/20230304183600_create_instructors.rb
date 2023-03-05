class CreateInstructors < ActiveRecord::Migration[7.0]
  def change
    create_table :instructors do |t|
      t.string  :name, null: false
      t.string  :email, null: false
      t.string  :password, null: false
      t.boolean :active, default: true
      t.string  :status

      t.timestamps
    end
  end
end
