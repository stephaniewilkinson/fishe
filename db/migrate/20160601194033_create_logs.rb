class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :subject_name
      t.text :comment
      t.boolean :deceased
      t.integer :weight
      t.integer :treatments

      t.timestamps null: false
    end
  end
end
