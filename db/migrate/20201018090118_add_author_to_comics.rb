class AddAuthorToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :author, :string
  end
end
