class CreateCommentaries < ActiveRecord::Migration[8.0]
  def change
    create_table :commentaries do |t|
      t.string :name
      t.text :text
      t.references :task, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
