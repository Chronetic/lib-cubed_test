class AddPagesToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :pages, :integer
  end
end
