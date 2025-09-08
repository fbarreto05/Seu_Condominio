class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :beginning
      t.date :end
      t.float :estimated_cost
      t.string :status

      t.timestamps
    end
  end
end
