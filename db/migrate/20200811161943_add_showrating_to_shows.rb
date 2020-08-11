class AddShowratingToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :showrating, :float
  end
end
