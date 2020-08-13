class AddRatingToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :bookrating, :float
  end
end
