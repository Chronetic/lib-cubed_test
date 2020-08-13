class AddIsbnToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :isbn, :integer
  end
end
