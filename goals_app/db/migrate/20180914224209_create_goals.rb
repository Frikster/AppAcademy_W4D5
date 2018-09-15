class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null:false
      t.text :details, null:false
      t.boolean :visibility, default: true
      t.boolean :finished, default: false
      t.integer :cheers, default: 0
      t.integer :user_id, null:false

      t.timestamps
    end
    add_index :goals, :user_id
  end
end
