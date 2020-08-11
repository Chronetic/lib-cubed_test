class AddTitlelongToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :titlelong, :sting
  end
end
