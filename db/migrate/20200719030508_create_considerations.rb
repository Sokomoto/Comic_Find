class CreateConsiderations < ActiveRecord::Migration[5.2]
  def change
    create_table :considerations do |t|
      t.integer :user_id
      t.string :title
      t.text :consideration
      t.timestamps
    end
  end
end
