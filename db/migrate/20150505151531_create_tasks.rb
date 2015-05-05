class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :complete, default: false
      t.string :description
      t.date :due_date
      t.references :list

      t.timestamps null: false
    end
  end
end
