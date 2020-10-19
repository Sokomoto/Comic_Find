class CreateImpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :impressions do |t|
      t.integer :user_id
      t.integer :comic_id
      t.text :impression
      t.timestamps
    end
  end
end
