class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :name
      t.text :summary
      t.integer :budget
      t.references :scientist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
